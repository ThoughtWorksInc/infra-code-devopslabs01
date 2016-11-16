docker.build:
	docker build -t buildpack-iac .

docker.shell:
	docker run --rm -it buildpack-iac /bin/bash