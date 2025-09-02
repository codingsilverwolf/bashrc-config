source ~/.bash_modules/validate_env.sh


nav_fzf() {
  echo "📂 Navegando a ~/storage/shared/Documents"
  sleep 2
  cd "$DOCS_PATH"
  cd "$(find . -type d -not -path '*/\.*' 2>/dev/null | fzf)"
}
alias nav='nav_fzf'

echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"

# '*/\.*' = Cualquier cosa, seguida de una barra inclinada (/), seguida de un punto literal (.), seguida de cualquier otra cosa. Es decir, evitamos buscar directorios ocultos.
