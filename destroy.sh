#!/bin/bash

docker build . -t "snt-tf:latest"
docker run --rm -ti -e ARM_CLIENT_ID=$ARM_CLIENT_ID -e ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET \
-e ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID -e ARM_TENANT_ID=$ARM_TENANT_ID \
-v $PWD/:/tmp/ snt-tf:latest destroy