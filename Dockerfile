FROM python:2

RUN apt-get update && apt-get install -y groff
RUN pip install awscli

WORKDIR /iac
COPY entrypoint.sh entrypoint.sh
COPY cfn_example.json cfn_example.json

ENTRYPOINT ["./entrypoint.sh"]

