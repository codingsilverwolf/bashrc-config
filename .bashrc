# ─── Detección de entorno ───────────────────────────────────────
detect_env() {
  if grep -qi "alpine" /etc/os-release 2>/dev/null; then
    echo "acode"
  elif [ -n "$PREFIX" ] && [ -d "$PREFIX/bin" ]; then
    echo "termux"
  else
    echo "unknown"
  fi
}

export ENV_TYPE="$(detect_env)"

# ─── Mensaje visual ─────────────────────────────────────────────
case "$ENV_TYPE" in
  termux) echo "🧭 Entorno detectado: Termux (termux)" ;;
  acode) echo "🧭 Entorno detectado: Acode Terminal (acode)" ;;
  *) echo "🧭 Entorno detectado: Desconocido ($ENV_TYPE)" ;;
esac

# ─── Ruta portable para documentos ──────────────────────────────
case "$ENV_TYPE" in
  termux) export DOCS_PATH="$HOME/storage/shared/Documents" ;;
  acode) export DOCS_PATH="$HOME/Documents" ;;
  *) export DOCS_PATH="$HOME" ;;
esac

echo "📁 Ruta de documentos: $DOCS_PATH"

# ─── Validación y creación si no existe ─────────────────────────
if [ ! -d "$DOCS_PATH" ]; then
  mkdir -p "$DOCS_PATH" && echo "📂 Carpeta creada: $DOCS_PATH"
fi



# ─── Identificador personalizado ────────────────────────────────
prompt_identity() {
  echo "creador@termux"
}

# ─── Carga automática de módulos ────────────────────────────────
for module in ~/.bash_modules/*.sh; do
  [[ "$module" == *ssh_autoload.sh ]] && continue
  source "$module"
done

# ─── Cargar agente SSH al final ─────────────────────────────────
source ~/.bash_modules/ssh_autoload.sh
