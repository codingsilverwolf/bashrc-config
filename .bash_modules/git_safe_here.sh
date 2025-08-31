# ── Módulo: git_safe_here ──

# Carga entorno y valida antes de ejecutar
source ~/.bash_modules/validate_env.sh


git-safe-here() {
  # Paso 1: Validación funcional directa
  if ! git rev-parse HEAD >/dev/null 2>&1; then
    echo "❌ No estás dentro de un repositorio Git funcional"
    return 1
  fi

  # Paso 2: Detección de raíz del repo
  repo_path=$(git rev-parse --show-toplevel 2>/dev/null)
  [ -z "$repo_path" ] && repo_path=$(pwd)

  # Paso 3: Verificación de seguridad
  already_safe=$(git config --global --get-all safe.directory | grep -Fx "$repo_path")

  if [ -n "$already_safe" ]; then
    echo "✅ Ya está marcado como seguro: $repo_path"
  else
    git config --global --add safe.directory "$repo_path"
    echo "🔐 Agregado como seguro: $repo_path"
  fi
}

# ── Trazabilidad ──
echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"
