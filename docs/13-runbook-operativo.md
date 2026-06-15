# Runbook operativo

## Validar credenciales

aws sts get-caller-identity

## Validar Terraform

cd infraestructura/ambientes/academy
terraform fmt -recursive
terraform init
terraform validate
terraform plan

## Error frecuente: ExpiredToken

Renovar credenciales desde AWS Academy -> Learner Lab -> AWS Details -> AWS CLI.

## Error frecuente: No configuration files

Ejecutar Terraform desde infraestructura/ambientes/academy, no desde la raiz del repo.
