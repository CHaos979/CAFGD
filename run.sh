#!/bin/bash
# screen -dmS sim-2025_11_9-Artifacts bash -c "bash run_scripts_11_9.sh"

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/01-Random/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/02-DotProd/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/03-GpuClustering/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/04-GpuPacking/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/05-BestFit/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/06-FGD/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

# 07, CAFGD, CAFGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2025_11_9/openb_pod_list_gpuspec10/07-CAFGD/0" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -CAFGD 1000 -gpusel CAFGD -dimext share -norm max -tune 0 -tuneseed 42 -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"  &

date & wait

wait && date
