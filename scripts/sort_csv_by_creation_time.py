#!/usr/bin/env python3
"""
Sort CSV file(s) by the `creation_time` column.

Usage examples:
  # Sort a single file and write to new file with _sorted suffix
  python3 scripts/sort_csv_by_creation_time.py data/csv/openb_pod_list_cpu050.csv

  # Sort in-place
  python3 scripts/sort_csv_by_creation_time.py -i data/csv/openb_pod_list_cpu050.csv

  # Sort all CSV files in a directory (write _sorted files)
  python3 scripts/sort_csv_by_creation_time.py -d data/csv/

  # Change key or sort descending
  python3 scripts/sort_csv_by_creation_time.py -k creation_time -r -d data/csv/

The script is case-insensitive for the column name and will try to coerce the column to numeric
for proper sorting. Files missing the column are skipped with a warning.
"""

import sys
from pathlib import Path
import pandas as pd


def sort_csv_file(infile: Path, key: str = "creation_time", descending: bool = False, inplace: bool = False, outfile: Path = None) -> bool:
    try:
        df = pd.read_csv(infile)
    except Exception as e:
        print(f"ERROR: failed to read {infile}: {e}", file=sys.stderr)
        return False

    # find column case-insensitively
    matches = [c for c in df.columns if c.strip().lower() == key.strip().lower()]
    if not matches:
        print(f"WARN: column '{key}' not found in {infile}. Available columns: {list(df.columns)}", file=sys.stderr)
        return False
    col = matches[0]

    # try convert to numeric (coerce errors to NaN so they sort to the end)
    try:
        df[col] = pd.to_numeric(df[col], errors='coerce')
    except Exception:
        pass

    df_sorted = df.sort_values(by=col, ascending=not descending)

    if inplace:
        out_path = infile
    else:
        if outfile:
            out_path = Path(outfile)
        else:
            out_path = infile.with_name(infile.stem + '_sorted' + infile.suffix)

    try:
        df_sorted.to_csv(out_path, index=False)
    except Exception as e:
        print(f"ERROR: failed to write {out_path}: {e}", file=sys.stderr)
        return False

    print(f"WROTE: {out_path} (sorted by '{col}', descending={descending})")
    return True


def main():
    # Hardcoded behavior: sort all CSV files under data/csv and write results to data/sorted_csv
    script_path = Path(__file__).parent
    repo_root = script_path.parent
    data_csv = repo_root / 'data' / 'csv'
    out_dir = repo_root / 'data' / 'sorted_csv'
    out_dir.mkdir(parents=True, exist_ok=True)

    if not data_csv.is_dir():
        print(f"ERROR: expected directory {data_csv} not found", file=sys.stderr)
        sys.exit(2)

    files = sorted([p for p in data_csv.glob('*.csv') if p.is_file()])
    if not files:
        print(f"No CSV files found in {data_csv}")
        return

    success = True
    for f in files:
        outp = out_dir / f.name
        ok = sort_csv_file(f, key='creation_time', descending=False, inplace=False, outfile=outp)
        # sort_csv_file already warns if the column is missing; skip those files
        success = success and ok

    if not success:
        sys.exit(1)


if __name__ == '__main__':
    main()
