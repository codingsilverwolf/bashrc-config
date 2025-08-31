source ~/.bash_modules/validate_env.sh
validate_env || return




# ─── Función para obtener rama Git ───
parse_git_branch() {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [ -n "$branch" ] && echo " 🌴 ($branch)"
}

# ─── Prompt con rama Git y nombre personalizado ──────────────────────
export PS1='\[\e[0;32m\]$(prompt_identity) \[\e[0;34m\]\w\[\e[0;33m\]$(parse_git_branch)\[\e[0m\]\n\$ '

echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"

