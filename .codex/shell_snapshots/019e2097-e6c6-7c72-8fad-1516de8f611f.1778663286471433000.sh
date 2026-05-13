# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
__conda_activate () {
	if [ -n "${CONDA_PS1_BACKUP:+x}" ]
	then
		PS1="$CONDA_PS1_BACKUP" 
		\unset CONDA_PS1_BACKUP
	fi
	\local ask_conda
	ask_conda="$(PS1="${PS1:-}" __conda_exe shell.posix "$@")"  || \return
	\eval "$ask_conda"
	__conda_hashr
}
__conda_exe () {
	(
		if [ -n "${_CE_M:+x}" ] && [ -n "${_CE_CONDA:+x}" ]
		then
			"$CONDA_EXE" $_CE_M $_CE_CONDA "$@"
		else
			"$CONDA_EXE" "$@"
		fi
	)
}
__conda_hashr () {
	if [ -n "${ZSH_VERSION:+x}" ]
	then
		\rehash
	elif [ -n "${POSH_VERSION:+x}" ]
	then
		:
	else
		\hash -r
	fi
}
__conda_reactivate () {
	echo "'__conda_reactivate' is deprecated and will be removed in 25.9. Use '__conda_activate reactivate' instead." >&2
	__conda_activate reactivate
}
conda () {
	\local cmd="${1-__missing__}"
	case "$cmd" in
		(activate | deactivate) __conda_activate "$@" ;;
		(install | update | upgrade | remove | uninstall) __conda_exe "$@" || \return
			__conda_activate reactivate ;;
		(*) __conda_exe "$@" ;;
	esac
}

# setopts 2
setopt nohashdirs
setopt login

# aliases 2
alias run-help=man
alias which-command=whence

# exports 33
export CODEX_INTERNAL_ORIGINATOR_OVERRIDE='Codex Desktop'
export CODEX_SHELL=1
export COMMAND_MODE=unix2003
export CONDA_DEFAULT_ENV=base
export CONDA_EXE=/opt/anaconda3/bin/conda
export CONDA_PREFIX=/opt/anaconda3
export CONDA_PROMPT_MODIFIER='(base) '
export CONDA_PYTHON_EXE=/opt/anaconda3/bin/python
export CONDA_SHLVL=1
export DISABLE_AUTO_UPDATE=true
export GSETTINGS_SCHEMA_DIR=/opt/anaconda3/share/glib-2.0/schemas
export GSETTINGS_SCHEMA_DIR_CONDA_BACKUP=''
export HOME=/Users/admin
export LANG=C.UTF-8
export LOGNAME=admin
export LOG_FORMAT=json
export MallocNanoZone=0
export OSLogRateLimit=64
export RUST_LOG=warn
export SHELL=/bin/zsh
export SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.d7L28M12dJ/Listeners
export TMPDIR=/var/folders/5t/8412zb2j4f90j33pk9d2cj7c0000gn/T/
export USER=admin
export XPC_FLAGS=0x0
export XPC_SERVICE_NAME=0
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOSTARTED=true
export _CE_CONDA=''
export _CE_M=''
export _CONDA_EXE=/opt/anaconda3/bin/conda
export _CONDA_ROOT=/opt/anaconda3
export __CFBundleIdentifier=com.openai.codex
export __CF_USER_TEXT_ENCODING=0x1F5:0x19:0x34
