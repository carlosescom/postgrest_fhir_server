FROM fhirbase/fhirbase:v0.1.1

USER root

WORKDIR /fhirbase

COPY sql/ ./sql
COPY scripts/ ./scripts
COPY scripts-postgrest/ ./scripts-postgrest
COPY synthea/output/fhir/ ./synthea/output/fhir/
COPY data/ ./data

# Set the permissions
RUN chown -R postgres:postgres  ./sql/* && \
    chown -R postgres:postgres  ./scripts/* && \
    chown -R postgres:postgres  ./scripts-postgrest/* && \
    chown -R postgres:postgres  ./synthea/output/fhir/* && \
    chown -R postgres:postgres  ./data/*

USER postgres

RUN PGDATA=/pgdata /docker-entrypoint.sh postgres  & \
    until psql -U postgres -c '\q'; do \
        >&2 echo "Postgres is starting up..."; \
        sleep 5; \
    done && \
    psql -U postgres -c 'create database fhir_db;' && \
    sh /fhirbase/scripts/dev/00_init.sh \
    pg_ctl -D /pgdata stop

EXPOSE 3000 5432

CMD pg_ctl -D /pgdata start && until psql -U postgres -c '\q'; do \
        >&2 echo "Postgres is starting up..."; \
        sleep 5; \
    done && \
    exec fhirbase -d fhir_db -n localhost -U postgres web
