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

# ─── Carga de módulos funcionales ───────────────────────────────
for module in ~/.bash_modules/*.sh; do
  case "$module" in
    *ssh_autoload.sh|*modulo_sensible.sh) continue ;;  # Excluir sensibles
    *) source "$module" ;;
  esac
done

echo "🔌 Módulos funcionales cargados"

# ─── Carga de módulos sensibles ─────────────────────────────────
source ~/.bash_modules/ssh_autoload.sh
# source ~/.bash_modules/modulo_sensible.sh  # Ejemplo futuro

echo "🛡️ Módulos sensibles cargados"
