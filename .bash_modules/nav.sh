nav_fzf() {
  cd ~/storage/shared/Documents
  cd "$(find . -type d -not -path '*/\.*' 2>/dev/null | fzf)" && echo "📂 Navegando a: $(pwd)"
}
alias nav='nav_fzf'

echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}")"
