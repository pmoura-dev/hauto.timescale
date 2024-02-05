FROM timescale/timescaledb:latest-pg16

WORKDIR /usr/src/scripts

COPY scripts/ ./

RUN find . -name "install.sh" -exec chmod +x {} \;

ENV POSTGRES_DB=hauto
ENV POSTGRES_USER=hautouser
ENV POSTGRES_PASSWORD=hautopass

EXPOSE 5432
