source ~/.bash_modules/validate_env.sh
validate_env || return



# ── Módulo: git_safe_here ──
git-safe-here() {
  # Intenta obtener la ruta raíz del repositorio Git
  repo_path=$(git rev-parse --show-toplevel 2>/dev/null)

  # Si falla, verifica si hay carpeta .git en el directorio actual
  if [ -z "$repo_path" ]; then
    if [ -d ".git" ]; then
      repo_path=$(pwd)
      # Verifica si ya está marcado como seguro antes de mostrar advertencia
      already_safe=$(git config --global --get-all safe.directory | grep -Fx "$repo_path")
      [ -z "$already_safe" ] && echo "⚠️ Git no pudo detectar el repo, usando $(pwd)"
    else
      echo "❌ No estás dentro de un repositorio Git"
      return 1
    fi
  fi

  # Verifica si ya está marcado como seguro en la configuración global
  already_safe=$(git config --global --get-all safe.directory | grep -Fx "$repo_path")

  if [ -n "$already_safe" ]; then
    echo "✅ Ya está marcado como seguro: $repo_path"
  else
    # Agrega el directorio como seguro en la configuración global
    git config --global --add safe.directory "$repo_path"
    echo "🔐 Agregado como seguro: $repo_path"
  fi
}

# ── Trazabilidad ──
echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"

