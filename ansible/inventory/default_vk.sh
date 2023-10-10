#!/bin/bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TERRAFORM_INVENTORY=`which terraform-inventory`
TF_STATE="$CURRENT_DIR/../../terraform"
"$TERRAFORM_INVENTORY" "$@" "$TF_STATE"