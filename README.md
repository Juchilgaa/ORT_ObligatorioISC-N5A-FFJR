# ORT - Obligatorio Implementación de Soluciones Cloud

Repositorio del obligatorio de la materia **Implementación de Soluciones Cloud**.

El objetivo del proyecto es implementar en AWS una arquitectura equivalente y mejorada a la solución planteada en la letra del obligatorio, utilizando infraestructura como código, servicios administrados, documentación técnica y evidencias de funcionamiento.

---

## Integrantes

| Integrante | Rol dentro del proyecto |
|---|---|
| Fferreira | Infraestructura, seguridad, RDS, monitoreo y documentación técnica |
| JRecalde | Red, balanceador, documentación inicial y revisión cruzada |

---

## Arquitectura propuesta

La solución se basa en una arquitectura clásica en AWS, separando las capas pública, aplicación y datos.

```mermaid
flowchart TD
    usuario[Usuario / Internet] --> alb[Application Load Balancer público]

    subgraph vpc[VPC 10.0.0.0/16]
        subgraph publicas[Subredes públicas]
            alb
            nat[NAT Gateway]
            igw[Internet Gateway]
        end

        subgraph privadas_app[Subredes privadas de aplicación]
            ec2a[EC2 App AZ A]
            ec2b[EC2 App AZ B]
            asg[Auto Scaling Group]
        end

        subgraph privadas_db[Subredes privadas de base de datos]
            rds[(Amazon RDS PostgreSQL)]
        end

        alb --> ec2a
        alb --> ec2b
        asg --> ec2a
        asg --> ec2b
        ec2a --> rds
        ec2b --> rds
        ec2a --> nat
        ec2b --> nat
        nat --> igw
    end


## Validación Terraform

---

## Paso a paso para desplegar la solución

> Importante: estos pasos deben ejecutarse desde el equipo que tenga credenciales vigentes de AWS Academy.  
> No ejecutar `terraform apply` sin revisar antes el resultado de `terraform plan`.

### 1. Clonar el repositorio

```bash
git clone git@github.com:Juchilgaa/ORT_ObligatorioISC-N5A-FFJR.git
cd ORT_ObligatorioISC-N5A-FFJR

### 2. Validar estructura del proyecto

Antes de trabajar con Terraform, validar que estén todos los archivos esperados:

./scripts/validar-estructura.sh

Resultado esperado: Validación finalizada sin errores

Este paso revisa estructura, documentación, módulos Terraform y que no existan credenciales o archivos sensibles trackeados por Git.

### 3. Configurar credenciales de AWS Academy

Iniciar el Learner Lab y copiar las credenciales desde:

AWS Academy -> Learner Lab -> AWS Details -> AWS CLI

### 4. Crear archivo local de variables

El archivo real terraform.tfvars no se sube al repositorio porque puede contener datos sensibles.

Crear una copia desde el ejemplo:

cp terraform.tfvars.example infraestructura/ambientes/academy/terraform.tfvars

Editar variables sensibles:

vi infraestructura/ambientes/academy/terraform.tfvars

Ejemplo de valor a revisar:

db_password = "CAMBIAR_ESTA_PASSWORD"

Cambiarlo por una contraseña válida para el entorno académico.


5. Inicializar Terraform

Entrar al ambiente Terraform:

cd infraestructura/ambientes/academy

Inicializar providers y módulos:

terraform init
6. Formatear y validar Terraform

Ejecutar:

terraform fmt -recursive
terraform validate

Resultado esperado:

Success! The configuration is valid.
7. Revisar el plan de ejecución

Generar el plan:

terraform plan

Revisar que Terraform proponga crear los recursos esperados:

VPC.
Subredes públicas y privadas.
Internet Gateway.
NAT Gateway.
Security Groups.
Application Load Balancer.
Target Group.
RDS PostgreSQL privado.
Alarmas y dashboard de CloudWatch.

No continuar si el plan muestra destrucción de recursos inesperada.

8. Aplicar la infraestructura

Una vez revisado el plan:

terraform apply

Confirmar escribiendo:

yes

Se recomienda que este paso lo ejecute un solo integrante para evitar inconsistencias de estado.

9. Obtener outputs

Luego del despliegue, revisar los outputs:

terraform output

Para obtener el DNS del balanceador:

terraform output alb_dns_name
10. Validar recursos en AWS

Desde la consola de AWS o CLI, verificar:

VPC creada.
Subredes en dos zonas de disponibilidad.
ALB activo.
Target Group creado.
RDS en estado available.
Dashboard de CloudWatch creado.
Alarmas de CloudWatch creadas.
11. Pruebas básicas

Cuando la capa de cómputo y aplicación esté implementada, probar el ALB:

curl http://DNS_DEL_ALB

También se podrá probar el endpoint de salud:

curl http://DNS_DEL_ALB/health
12. Destruir infraestructura al finalizar

Al terminar las pruebas en AWS Academy:

terraform destroy

Confirmar con:

yes

Esto libera recursos del lab y evita consumo innecesario.









