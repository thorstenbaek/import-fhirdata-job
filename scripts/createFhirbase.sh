echo Start create database fhirbase
psql -h $POSTGRES_SERVER_HOST -p 5432 -U postgres -W postgres -c 'create database fhirbase;'
 
echo Start fhirbase init
fhirbase --host $POSTGRES_SERVER_HOST -p 5432 -d fhirbase -U postgres -W postgres --fhir=3.3.0 init
