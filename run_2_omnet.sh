#!/bin/bash
  
set -e

if [ $# -lt 2 ]; then
    echo "Usage ./run_4_groundtruth.sh variant num_clusters [simulate_options]"
    exit 1
fi

set -x

. /etc/profile.d/mimicnet.sh

BASE_DIR=`pwd`
VARIANT="${1}"
NUM_CLUSTERS="${2}"

echo "Running MimicNet simulation..."
cd simulate/simulate_${VARIANT}
exec 5>&1
RESULTS_DIR=$(./run.sh RecordEval -c ${NUM_CLUSTERS} ${@:3} | tee /dev/fd/5 | tail -n 1)

echo "Parsing results..."
cd ${BASE_DIR}
prepare/parse_pdmps.sh simulate/simulate_${VARIANT}/${RESULTS_DIR} ${NUM_CLUSTERS}

