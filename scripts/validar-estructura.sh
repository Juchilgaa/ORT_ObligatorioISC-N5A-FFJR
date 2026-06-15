#!/usr/bin/env bash

set -euo pipefail

ERRORS=0

ok() {
  echo "✅ $1"
}

fail() {
  echo "❌ $1"
  ERRORS=$((ERRORS + 1))
}

check_file() {
  local file="$1"
  if [ -f "$file" ]; then
    ok "Archivo existe: $file"
  else
    fail "Falta archivo: $file"
  fi
}

check_dir() {
  local dir="$1"
  if [ -d "$dir" ]; then
    ok "Directorio existe: $dir"
  else
    fail "Falta directorio: $dir"
  fi
}

echo "======================================"
echo " Validación de estructura del proyecto"
echo "======================================"
echo ""

echo "== Archivos raíz =="
check_file "README.md"
check_file ".gitignore"
check_file "terraform.tfvars.example"
echo ""

echo "== Directorios principales =="
check_dir "infraestructura"
check_dir "infraestructura/ambientes/academy"
check_dir "infraestructura/modulos"
check_dir "aplicacion"
check_dir "docs"
check_dir "pruebas"
check_dir "scripts"
check_dir ".github"
check_dir ".github/workflows"
echo ""

echo "== Ambiente Terraform academy =="
check_file "infraestructura/ambientes/academy/main.tf"
check_file "infraestructura/ambientes/academy/providers.tf"
check_file "infraestructura/ambientes/academy/versions.tf"
check_file "infraestructura/ambientes/academy/variables.tf"
check_file "infraestructura/ambientes/academy/outputs.tf"
check_file "infraestructura/ambientes/academy/README.md"
check_file "infraestructura/ambientes/academy/.terraform.lock.hcl"
echo ""

echo "== Módulos Terraform =="
for modulo in red seguridad balanceador computo base_datos monitoreo respaldos; do
  check_dir "infraestructura/modulos/$modulo"

  if [ "$modulo" = "computo" ] || [ "$modulo" = "respaldos" ]; then
    echo "ℹ️  Módulo pendiente o parcial: infraestructura/modulos/$modulo"
  else
    check_file "infraestructura/modulos/$modulo/main.tf"
    check_file "infraestructura/modulos/$modulo/variables.tf"
    check_file "infraestructura/modulos/$modulo/outputs.tf"
  fi
done
echo ""

echo "== Documentación =="
check_file "docs/01-alcance.md"
check_file "docs/03-red-y-seguridad.md"
check_file "docs/07-rds-y-respaldos.md"
check_file "docs/08-monitoreo.md"
check_file "docs/11-uso-de-ia.md"
check_file "docs/12-matriz-trazabilidad.md"
check_file "docs/13-runbook-operativo.md"
echo ""

echo "== Directorios de documentación =="
check_dir "docs/decisiones"
check_dir "docs/diagramas"
check_dir "docs/evidencias"
echo ""

echo "== Pull Request template =="
check_file ".github/pull_request_template.md"
echo ""

echo "== Seguridad: archivos sensibles =="
if git ls-files | grep -q "terraform.tfvars$"; then
  fail "terraform.tfvars está trackeado por Git. Debe eliminarse del repo."
else
  ok "terraform.tfvars no está trackeado por Git"
fi

if git ls-files | grep -E "(\.pem|\.key|credentials|\.env$)" >/dev/null 2>&1; then
  fail "Hay posibles archivos sensibles trackeados por Git"
  git ls-files | grep -E "(\.pem|\.key|credentials|\.env$)"
else
  ok "No se detectan credenciales, claves ni .env trackeados"
fi
echo ""

echo "== Validación Terraform =="
if command -v terraform >/dev/null 2>&1; then
  (
    cd infraestructura/ambientes/academy
    terraform fmt -check -recursive >/dev/null
    terraform validate >/dev/null
  )
  ok "Terraform fmt y validate OK"
else
  fail "Terraform no está instalado o no está en el PATH"
fi
echo ""

echo "======================================"
if [ "$ERRORS" -eq 0 ]; then
  echo "✅ Validación finalizada sin errores"
  exit 0
else
  echo "❌ Validación finalizada con $ERRORS error(es)"
  exit 1
fi
