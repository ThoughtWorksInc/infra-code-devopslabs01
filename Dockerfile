FROM python:2

RUN apt-get update && apt-get install -y groff
RUN pip install awscli ansible credstash boto

WORKDIR /iac
COPY ./ /iac/

ENTRYPOINT ["scripts/entrypoint.sh"]

