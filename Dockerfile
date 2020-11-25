FROM postgres:11.5

COPY ./fhirbase/fhirbase-linux-amd64 /usr/bin/fhirbase
RUN chmod +x /usr/bin/fhirbase

COPY fhir-data /usr/local/fhir-data

CMD ["/bin/bash","-c", \
    "echo 'creating fhirbase database'; \
    psql -U postgres -c 'create database fhirbase;'; \
    echo 'fhirbase database created'; \
    fhirbase -d fhirbase --fhir=3.3.0 init; \
    echo 'fhirbase database initialized'; \
    echo processing ndjson files; \
    FILES='/usr/local/fhir-data/*' ; \
    for f in $FILES; \
        do echo Processing $f file...; \
    fhirbase -d fhirbase load --mode=insert $f; \
    done; "]


    