# Ambiente AWS Academy
# Los módulos se irán incorporando progresivamente:
# - red
# - seguridad
# - balanceador
# - computo
# - base_datos
# - monitoreo
# - respaldos

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}
