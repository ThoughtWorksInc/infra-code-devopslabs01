docker.build:
	docker build -t buildpack-iac .

docker.shell: docker.build
	@docker run --rm \
		-e "AWS_ACCESS_KEY_ID=${BUILD_AWS_ACCESS_KEY_ID}" \
		-e "AWS_SECRET_ACCESS_KEY=${BUILD_AWS_SECRET_ACCESS_KEY}" \
		-it buildpack-iac /bin/bash