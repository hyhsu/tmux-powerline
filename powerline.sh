#!/usr/bin/env bash

export TMUX_POWERLINE_DIR_HOME="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

source "${TMUX_POWERLINE_DIR_HOME}/config/helpers.sh"
source "${TMUX_POWERLINE_DIR_HOME}/config/paths.sh"
source "${TMUX_POWERLINE_DIR_HOME}/config/shell.sh"
source "${TMUX_POWERLINE_DIR_HOME}/config/defaults.sh"

source "${TMUX_POWERLINE_DIR_LIB}/arg_processing.sh"
source "${TMUX_POWERLINE_DIR_LIB}/formatting.sh"
source "${TMUX_POWERLINE_DIR_LIB}/muting.sh"
source "${TMUX_POWERLINE_DIR_LIB}/powerline.sh"
source "${TMUX_POWERLINE_DIR_LIB}/rcfile.sh"

if ! powerline_muted "$1"; then
	process_settings
	check_arg_side "$1"
	if [ $1 == "init" ]; then
		init_powerline
	else
		print_powerline "$1"
	fi
fi

exit 0
