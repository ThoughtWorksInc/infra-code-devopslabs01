FROM python:2

RUN apt-get update && apt-get install -y groff
RUN pip install awscli ansible credstash boto

WORKDIR /iac
COPY entrypoint.sh entrypoint.sh
COPY cfn_example.json cfn_example.json
COPY ansible.cfg ansible.cfg
COPY inventory inventory
COPY pb.yml pb.yml
COPY ec2.py ec2.py
COPY ec2.ini ec2.ini

ENTRYPOINT ["./entrypoint.sh"]

