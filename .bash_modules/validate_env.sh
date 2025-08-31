# ── Módulo: validate_env ──

[ -z "$ENV_TYPE" ] && echo "❌ ENV_TYPE no definido. Abortando módulo: $(basename "${BASH_SOURCE[1]}")" && return
[ -z "$DOCS_PATH" ] && echo "❌ DOCS_PATH no definido. Abortando módulo: $(basename "${BASH_SOURCE[1]}")" && return
[ -z "$SSH_KEY_PATH" ] && echo "❌ SSH_KEY_PATH no definido. Abortando módulo: $(basename "${BASH_SOURCE[1]}")" && return