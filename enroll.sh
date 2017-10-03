#!/bin/bash
set -e
touch ./service-discovery-service.txt
az container show --name service-discovery-service --resource-group kitchen-responsible-rg --query ipAddress.ip > ./service-discovery-service.txt
ip=$(cat ./service-discovery-service.txt | tr -d '"')
curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"service-discovery-service\", \"ip\":\"$ip\"}" -i http://localhost:5000/api/services/