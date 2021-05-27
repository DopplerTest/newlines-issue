doppler-project:
	doppler projects create ssh
	doppler setup --project ssh --config dev
	@echo 'Adding `TEST_SERVER` secret which needs a user@domain value for testing the SSH connection'
	@echo 'Creating service token to add to GitHub Secrets as `DOPPLER_TOKEN`'
	doppler configs tokens create --plain GitHub

gen-key:
	@echo 'Creating SSH key'
	ssh-keygen -t ed25519 -f id_rsa -N ''
	@echo 'Copying private key to clipboard'
	@sleep 2
	cat id_rsa | pbcopy
	@echo 'Opening Doppler dashboard for pasting in private key with name SSH_KEY'
	doppler open dashboard
	rm -f id_rsa id_rsa.pub

set-key-cli:
	ssh-keygen -t ed25519 -f id_rsa -N ''
	doppler secrets set SSH_KEY="$$(cat id_rsa)"
	rm -f id_rsa id_rsa.pub

