# ── Función: export_modules ──
export_modules() {
  local source_dir="$HOME/.bash_modules"
  local target_base="$HOME/storage/shared/Documents"
  local timestamp="$(date +%Y-%m-%d_%H-%M)"
  local target_dir="$target_base/bash_modules_backup_$timestamp"

  # Mensaje de inicio
  echo "📦 Exportando módulos desde $source_dir → $target_dir"

  # Crear carpeta destino si no existe
  mkdir -p "$target_dir"

  # Copiar con trazabilidad mínima
  for module in "$source_dir"/*.sh; do
    cp "$module" "$target_dir/" && echo "✅ Copiado: $(basename "$module")"
  done

  # Confirmación final
  echo "🗂️ Backup completo: $target_dir"
}

# ── Alias ──
alias export_modules='export_modules'

# ── Trazabilidad ──
echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"
