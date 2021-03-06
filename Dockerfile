FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir data

RUN apt-get update -y --no-install-recommends &&\
apt-get install -y git etcd-server etcd-client python3 python3-pip python3-setuptools postgresql python-psycopg2 postgresql-contrib libpq-dev --no-install-recommends

COPY . ./

RUN pip3 install -r requirements.txt

ENTRYPOINT ["sh", "-c"]

CMD ["sh env_to_conf.sh && python3 ./async_launcher.py"]
