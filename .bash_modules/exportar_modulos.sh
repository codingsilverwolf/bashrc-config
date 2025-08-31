source ~/.bash_modules/validate_env.sh

# ── Módulo: backup_env ──


# Carpeta destino con timestamp
BACKUP_ROOT="$DOCS_PATH/bash_backups"
TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"
BACKUP_DIR="$BACKUP_ROOT/$ENV_TYPE-$TIMESTAMP"

# Crear carpeta
mkdir -p "$BACKUP_DIR"

# Archivos a respaldar
cp "$HOME/.bashrc" "$BACKUP_DIR/bashrc.bak" 2>/dev/null
cp -r "$HOME/.bash_modules" "$BACKUP_DIR/bash_modules.bak" 2>/dev/null
cp "$HOME/.gitconfig" "$BACKUP_DIR/" 2>/dev/null
cp "$HOME/.gitignore_global" "$BACKUP_DIR/" 2>/dev/null

# Clave pública (no sensible)
if [ -f "$SSH_KEY_PATH.pub" ]; then
  cp "$SSH_KEY_PATH.pub" "$BACKUP_DIR/" && echo "📤 Clave pública respaldada: $(basename "$SSH_KEY_PATH.pub")"
fi

# Mensajes visuales
echo "🗂️ Backup creado en: $BACKUP_DIR"
ls -1 "$BACKUP_DIR" | sed 's/^/   └── /'

# Confirmación de carga del módulo
echo "🔧 Módulo cargado: $(basename "${BASH_SOURCE[0]}") [$ENV_TYPE]"
