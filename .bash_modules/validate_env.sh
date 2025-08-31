validate_env() {
  [ -z "$ENV_TYPE" ] && echo "❌ ENV_TYPE no definido. Abortando módulo: $(basename "${BASH_SOURCE[1]}")" && return 1
  [ -z "$DOCS_PATH" ] && echo "❌ DOCS_PATH no definido. Abortando módulo: $(basename "${BASH_SOURCE[1]}")" && return 1
  [ -z "$SSH_KEY_PATH" ] && echo "❌ SSH_KEY_PATH no definido. Abortando módulo: $(basename "${BASH_SOURCE[1]}")" && return 1
}
