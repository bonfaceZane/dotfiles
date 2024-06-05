log := "warn"

export JUST_LOG := log

play:
    ansible-playbook main.yml

vault ACTION:
    ansible-vault {{ ACTION }} vars/vault.yml

view:
    ansible-vault view vars/vault.yml

req *FORCE:
    ansible-galaxy install -r requirements.yml -p {{ FORCE }}