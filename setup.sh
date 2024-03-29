#!/bin/bash
set -eu

install_local_scripts() {
	echo "Installing local scripts:..."
	local_scripts_path="${HOME}"/.local/bin
	if [[ ! -d "${HOME}/.local" ]]; then
		mkdir "${HOME}/.local"
	fi

	ln -svnfF "${PWD}/bin/" "${local_scripts_path}"
}

ensure_brew_exists() {
  echo "Ensuring brew exists..."
  if [[ ! -x /usr/local/bin/brew ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_brew_utils() {
	echo "Installing Homebrew Utilities"
	brew update
	brew bundle
}

set_bash_profile() {
	echo "Setting bash profile"
	install_symlink "${PWD}/bash_profile" "${HOME}/.bash_profile"
	install_symlink "${PWD}/bash_aliases" "${HOME}/.bash_aliases"
}

setup_ruby() {
	echo "Setting up Ruby"
	ruby-install --latest --no-reinstall ruby
}

setup_vim() {
	echo "Setting up VIM config"
	mkdir -p "${HOME}/.config/nvim"
	install_symlink "${PWD}/nvim/init.vim" "${HOME}/.config/nvim/init.vim"
	install_symlink "${PWD}/nvim/before.vim" "${HOME}/.config/nvim/before.vim"
	install_symlink "${PWD}/nvim/plugins.vim" "${HOME}/.config/nvim/plugins.vim"
	install_symlink "${PWD}/nvim/colorscheme.vim" "${HOME}/.config/nvim/colorscheme.vim"
	echo "Updating VIM"
	nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+UpdateRemotePlugins' '+qall'
	nvim '+GoInstallBinaries' '+qall'
}

setup_starship() {
	echo "Setting up Starship.rs config"
	mkdir -p "${HOME}/.config"
	install_symlink "${PWD}/starship.toml" "${HOME}/.config/starship.toml"
}

setup_tmux() {
	echo "Setting up tmux config"
	mkdir -p "${HOME}/.config"
	install_symlink "${PWD}/tmux.conf" "${HOME}/.config/tmux.conf"
}

install_symlink() {
    local src="$1"
    local target="$2"

    if [[ ! -f "${target}" ]]; then
        ln -s "${src}" "${target}"
    elif [[ ! -L "${target}" ]]; then
        echo "(-) Backing up existing file ${target}"
        mv "${target}" "${target}.bak"
        ln -s "${src}" "${target}"
    fi
}

main() {
	ensure_brew_exists
	install_brew_utils
	install_local_scripts
	set_bash_profile
	setup_ruby
	setup_vim
	setup_starship
  setup_tmux
	echo -n "\nSetup has finished."
}



main
