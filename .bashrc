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
