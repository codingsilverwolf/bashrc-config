# ── Módulo: ssh_autoload ──

# Mensaje previo para trazabilidad visual
echo "⏳ Preparando para cargar ssh_autoload..."

# Inicia el agente SSH si no está corriendo
if ! pgrep ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)" >/dev/null
  echo "🚀 ssh-agent iniciado"
fi

# Validación de existencia de clave
if [ ! -f "$SSH_KEY_PATH" ]; then
  echo "❌ Clave SSH no encontrada: $SSH_KEY_PATH"
else
  # Carga la clave si no está presente en el agente
  if ! ssh-add -l 2>/dev/null | grep -q "$SSH_KEY_NAME"; then
    ssh-add "$SSH_KEY_PATH" >/dev/null && echo "🔐 Clave SSH cargada: $SSH_KEY_NAME"
  else
    echo "✅ Clave SSH ya está activa: $SSH_KEY_NAME"
  fi
fi

# Confirmación de carga del módulo
echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"
