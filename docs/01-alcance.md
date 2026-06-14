# Alcance del proyecto

## Objetivo general

Implementar en AWS una arquitectura equivalente y mejorada a la solución planteada en el obligatorio de Implementación de Soluciones Cloud, utilizando infraestructura como código con Terraform, servicios administrados de AWS y documentación técnica de soporte.

## Alcance funcional

La solución contempla:

- Publicación de una aplicación web mediante un balanceador de carga.
- Capa de aplicación desplegada en instancias EC2 privadas.
- Escalabilidad automática mediante Auto Scaling Group.
- Base de datos administrada mediante Amazon RDS.
- Segmentación de red con subredes públicas y privadas.
- Reglas de seguridad restrictivas mediante Security Groups.
- Monitoreo mediante Amazon CloudWatch.
- Documentación técnica, pruebas y evidencias.

## Alcance técnico

La implementación se realizará utilizando:

- AWS como proveedor cloud.
- Terraform como herramienta de infraestructura como código.
- Docker para empaquetar la aplicación.
- Git y GitHub para control de versiones, ramas, Pull Requests y revisión cruzada.
- Markdown para documentación del proyecto.

## Fuera de alcance

Quedan fuera de alcance para esta entrega:

- Implementación con Kubernetes/EKS.
- Despliegue automático completo con Terraform desde GitHub Actions.
- Alta disponibilidad multi-región.
- Integración con dominios públicos reales y certificados TLS productivos.

Estas decisiones podrán justificarse en la documentación técnica del proyecto.
