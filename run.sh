ansible-playbook reproducer.yml \
    -i custom/inventory.yml \
    -e @scenarios/reproducers/va-hci.yml \
    -e @scenarios/reproducers/01-net-def.yaml \
    -e @scenarios/reproducers/02-host-config.yaml \
    -e @scenarios/reproducers/03-ocp-config.yaml \
    -e @scenarios/reproducers/04-scenario-vars.yaml \
    -e @scenarios/reproducers/05-tests.yaml \
    -e @scenarios/reproducers/06-baremetal-hosts.yaml \
    -e @custom/default-vars.yaml \
    -e @custom/secret.yml
#    -e cifmw_deploy_architecture=false
