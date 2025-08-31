source ~/.bash_modules/validate_env.sh


nav_fzf() {
  cd "$DOCS_PATH"
  cd "$(find . -type d -not -path '*/\.*' 2>/dev/null | fzf)" && echo "📂 Navegando a: $(pwd)"
}
alias nav='nav_fzf'

echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"

