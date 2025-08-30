# ── Módulo: ssh_autoload ──

# Mensaje previo para trazabilidad visual
echo "⏳ Preparando para cargar ssh_autoload..."

# Inicia el agente SSH si no está corriendo
if ! pgrep ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)" >/dev/null
fi

# Carga la clave si no está presente en el agente
if ! ssh-add -l 2>/dev/null | grep -q "id_ed25519_termux_cel"; then
  ssh-add ~/.ssh/id_ed25519_termux_cel >/dev/null && echo "🔐 Clave SSH cargada"
fi

# Confirmación de carga del módulo (trazabilidad embebida)
echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"

