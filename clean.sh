ansible-playbook reproducer-clean.yml --tags deepscrub \
    -i custom/inventory.yml \
    -e @scenarios/reproducers/va-hci.yml \
    -e @scenarios/reproducers/01-net-def.yaml \
    -e @scenarios/reproducers/02-host-config.yaml \
    -e @scenarios/reproducers/03-ocp-config.yaml \
    -e @scenarios/reproducers/04-scenario-vars.yaml \
    -e @scenarios/reproducers/05-tests.yaml \
    -e @scenarios/reproducers/06-baremetal-hosts.yaml \
    -e @custom/default-vars.yaml \
    -e @custom/secret.yml \
    -e @custom/hci.yaml \
    -e cifmw_deploy_architecture=true

sudo rm -vrf /home/zuul/.ssh/cifmw_ssh_config.d
sudo rm -vrf /home/zuul/ci-framework-data
sudo rm -vrf /home/zuul/src/github.com/openshift-metal3/dev-scripts
rm -vrf ~/.ssh/cifmw_ssh_config.d
rm -vrf ~/ansible_facts_cache/
echo nameserver 10.75.5.25 |sudo tee -a /etc/resolv.conf
