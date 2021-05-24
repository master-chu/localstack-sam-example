# Localstack SAM example
This app is the default Hello World SAM template API running in Docker against localstack.

All commands are run using the `awslocal` and `samlocal` executables, such that calls will point at `localhost` (where localstack is running), instead of a real AWS location.

## About
The API was generated by running the following on the `api` container:

```bash
# creates a directory with a name you provide, in my case "localstack-sam-example"
samlocal init 
```

## Setup
Bring up the containers:
```bash
docker-compose up -d
```

Deploy the app:
```bash
# create a shell session on the SAM container
docker-compose exec api sh -l

# cd into app directory (must run SAM CLI commands here)
cd localstack-sam-example

# creates/updates the .aws-sam directory with the built code
samlocal build

# deploys the code 
samlocal deploy --config-file=samconfig.toml
```

## Make API calls
When you deploy a new SAM build, it generates a new app ID, which is needed to make http calls. Run this command locally to see the new base URL
```bash
docker-compose exec aws sh -c "chmod 777 print_api_base_url.sh && ./print_api_base_url.sh"
```
Once you know the base url, you can make requests to the API. The Hello World app comes with a single endpoint at `/hello`.

The resulting command should look something like this:
```bash
curl -x GET http://localhost:4566/restapis/0ve7vd2lsz/Prod/_user_request_/hello
```

You should see the following result:
```
{"message":"hello world"}
```