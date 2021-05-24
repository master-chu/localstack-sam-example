api_id=$(awslocal apigateway get-rest-apis | grep "id" | cut -d '"' -f 4)
base_url="http://localhost:4566/restapis/$api_id/Prod/_user_request_"

echo $base_url