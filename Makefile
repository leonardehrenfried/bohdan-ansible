.PHONY: provision

# ansible

PLAYBOOK_CMD:=ANSIBLE_PIPELINING=true ansible-playbook
#PLAYBOOK_CMD:=ANSIBLE_PIPELINING=true ansible-playbook --vault-password-file vault-password

provision: galaxy-install
	${PLAYBOOK_CMD} -i hosts otp.yml

galaxy-install:
	rm -rf ~/.ansible/collections/ansible_collections/leonardehrenfried/
	ansible-galaxy collection install -r requirements.yml
	ansible-galaxy install -r requirements.yml

galaxy-install-force:
	ansible-galaxy collection install --force -r requirements.yml
	ansible-galaxy install --force -r requirements.yml

