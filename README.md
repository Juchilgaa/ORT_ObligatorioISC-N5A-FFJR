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
