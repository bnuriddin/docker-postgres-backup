FROM ubuntu
MAINTAINER Beishen Nuriddin uulu <bnuriddinu@gmail.com>

RUN apt-get update && \
    apt-get install -y wget curl netcat cron
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >/etc/apt/sources.list.d/postgresql.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && \
    apt-get install -y postgresql-10 curl && \
    curl https://dl.minio.io/client/mc/release/linux-amd64/mc > /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc && \ 
    mkdir /backup

ENV CRON_TIME="0 0 * * *" \
    PG_DB="--all-databases"


ADD run.sh /run.sh
RUN chmod +x /run.sh
VOLUME ["/backup"]

CMD ["/run.sh"]
