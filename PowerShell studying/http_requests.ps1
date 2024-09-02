function read_from_external_webrequest {
Write-Host This function is running the following command
Write-Host "invoke-webrequest https://qafj28hul4.execute-api.us-east-1.amazonaws.com/api/consumers/companies"
invoke-webrequest https://qafj28hul4.execute-api.us-east-1.amazonaws.com/api/consumers/companies
#https://qafj28hul4.execute-api.us-east-1.amazonaws.com/api/consumers/companies is an API I developed myself using AWS API gateway and AWS Lambda
#It's a simple API that return some text
}