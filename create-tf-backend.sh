#!/bin/bash

    RESOURCE_GROUP="acme-${ENV}-tfstate-${REGION_SHORT}-resgrp"
    STORAGE_ACCOUNT_NAME="acme${ENV}tfstates${REGION_SHORT}stor"
    KEY_VAULT_NAME="acme${ENV}tfstate${REGION_SHORT}vault"

    az group create -n $RESOURCE_GROUP -l $REGION
    az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP
    STORAGE_KEY=$(az storage account keys list -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP --query [0].value -o tsv)
    az keyvault create -n $KEY_VAULT_NAME -g $RESOURCE_GROUP --enable-purge-protection --enable-soft-delete
    az keyvault secret set --name "tfstatestorkey" --value $STORAGE_KEY --vault-name $KEY_VAULT_NAME
    az storage container create --account-key $STORAGE_KEY --account-name $STORAGE_ACCOUNT_NAME --name "tfstate"
