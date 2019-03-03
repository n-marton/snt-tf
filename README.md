This is a sample solution with terraform in feature parity with https://github.com/n-marton/snt-script

To make it able to run you have to do the following:
1. You need an Azure account. (https://azure.microsoft.com/en-us/free/)
2. You need the Azure cli. (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. You need to create an rbac account:
    1. `az login`
    2. ` az ad sp create-for-rbac -n "rest"  --role="Owner" --scopes="/subscriptions/$YOUR_SUBSCRIPTION_ID"`
4. Set the following environtment variables:
    1. ARM_CLIENT_ID -> 'appId' from rbac creation response
    2. ARM_CLIENT_SECRET -> 'password' from rbac creation response
    3. ARM_TENANT_ID -> 'tenant' from rbac creation response
    4. ARM_SUBSCRIPTION_ID -> your subscription id
5. `git clone git@github.com:n-marton/snt-tf.git`
6. `cd snt-tf`
8. To create the resources run `./create.sh`
9. To destroy the resources run `./destroy.sh`

This terraform repo has no remote state set, so the states stored locally.