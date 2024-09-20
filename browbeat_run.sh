#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

BASE_DIR="$(dirname "$(readlink -f "$0")")"

PLAYBOOK_FILE="${BASE_DIR}/browbeat_tasks.yml"

OSP_RELEASE="${OSP_RELEASE:-16.2}"
NETWORK_DRIVER="${NETWORK_DRIVER:-ovn}"

BUILD_URL="${BUILD_URL:-N/A}"
BUILD_NUMBER="${BUILD_NUMBER:-N/A}"
JOB_NAME="${JOB_NAME:-N/A}"

BROWBEAT_CONFIG_VARS_FILE="${BROWBEAT_CONFIG_VARS_FILE:-neutron-config-vars.yml}"
ELASTICSEARCH_ENABLED="${ELASTICSEARCH_ENABLED:-False}"
ELASTICSEARCH_HOST="${ELASTICSEARCH_HOST:-ospperf8.mobius.lab.eng.rdu2.redhat.com}"
COMPONENT="${COMPONENT:-neutron}"
DFG="${DFG:-network}"


#
# Execute installation playbook
#
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_NOCOWS=True
export ANSIBLE_STDOUT_CALLBACK=debug

ansible-playbook \
    --extra-vars "CLOUD_NAME=PerfCI-OSP${OSP_RELEASE}-${COMPONENT}-${NETWORK_DRIVER}" \
    --extra-vars "BROWBEAT_CONFIG_VARS_FILE=${BROWBEAT_CONFIG_VARS_FILE}" \
    --extra-vars "ELASTICSEARCH_ENABLED=${ELASTICSEARCH_ENABLED}" \
    --extra-vars "ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST}" \
    --extra-vars "BUILD_URL=${BUILD_URL}" \
    --extra-vars "BUILD_NUMBER=${BUILD_NUMBER}" \
    --extra-vars "DFG=${DFG}" \
    --extra-vars "JOB_NAME=${JOB_NAME}" \
    --extra-vars "NETWORK_DRIVER=${NETWORK_DRIVER}" \
    --verbose --verbose \
    "${PLAYBOOK_FILE}"
