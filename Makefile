# extracted bits for reuse:
DOCKER_RUN = docker run --rm \
		-e "AWS_ACCESS_KEY_ID=${BUILD_AWS_ACCESS_KEY_ID}" \
		-e "AWS_SECRET_ACCESS_KEY=${BUILD_AWS_SECRET_ACCESS_KEY}" \

docker.build:
	docker build -t buildpack-iac .

docker.shell: docker.build
	@$(DOCKER_RUN) -it buildpack-iac /bin/bash

provision: docker.build
	@$(DOCKER_RUN) buildpack-iac \
	ansible-playbook -i ec2.py site.yml
