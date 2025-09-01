# bashrc-config 🧠🔧

Repositorio modular para la gestión quirúrgica de `.bashrc` y sus módulos en entornos Android (Termux-Debian y Otras-terminales-Alpine)

## 📦 Estructura

```
.
├── .bash_modules/
│   ├── exportar_modulos.sh
│   ├── git_branch.sh
│   ├── git_safe_here.sh
│   ├── nav.sh
│   ├── ssh_autoload.sh
│   └── validate_env.sh
├── .git/
├── .bashrc
└── README.md

```

Cada módulo es autocontenible, trazable y activado según entorno detectado.

## 🧠 Filosofía

- Modularidad absoluta: Cada función, alias o configuración vive en su propio archivo.
- Portabilidad extrema: Compatible entre dispositivos y sistemas de archivos con restricciones (Android).
- Trazabilidad quirúrgica: Cada cambio es auditable, reversible y documentado.
- Sin automatismos opacos: Todo se valida antes de ejecutarse.

## 🚀 Uso

Ver nota en Capacities

## 🧪 Entornos soportados

- Termux (Android)
- Alpine (WSL, Docker, servidores)

## 📜 Licencia

MIT — libre para modificar, versionar y adaptar. Se recomienda mantener trazabilidad de cambios.

---
