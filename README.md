# bashrc-config 🧠🔧

Repositorio modular para la gestión quirúrgica de `.bashrc` y sus módulos en entornos Android (Termux-Debian y Otras-terminales-Alpine)

## 📦 Estructura

```
.
├── .bashrc
├── .bash_modules/
│   ├── termux.sh
│   ├── alpine.sh
│   └── common.sh
├── README.md
└── install.sh
```

Cada módulo es autocontenible, trazable y activado según entorno detectado.

## 🧠 Filosofía

- Modularidad absoluta: Cada función, alias o configuración vive en su propio archivo.
- Portabilidad extrema: Compatible entre dispositivos y sistemas de archivos con restricciones (Android).
- Trazabilidad quirúrgica: Cada cambio es auditable, reversible y documentado.
- Sin automatismos opacos: Todo se valida antes de ejecutarse.

## 🚀 Uso

1. Clonar el repositorio:

   ```bash
   git clone git@github.com:codingsilverwolf/bashrc-config.git
   ```

2. Reemplazar `.bashrc` y cargar módulos según entorno:

   ```bash
   source ~/.bashrc
   ```

3. Validar cada módulo con trazabilidad visual:

   ```bash
   ls -la ~/.bash_modules
   ```

## 🧪 Entornos soportados

- Termux (Android)
- Alpine (WSL, Docker, servidores)
- Google Colab (via `%bash`)

## 📜 Licencia

MIT — libre para modificar, versionar y adaptar. Se recomienda mantener trazabilidad de cambios.

---

> Este repositorio es una obra quirúrgica en evolución. Cada línea está validada, cada módulo documentado.  
> — Javier, codingsilverwolf
