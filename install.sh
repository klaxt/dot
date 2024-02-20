#!/usr/bin/env zsh
# https://github.com/mathiasbynens/dotfiles/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")";
git pull origin main;

target="$HOME"

# OLD
function copy() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "*.sh" \
		--exclude "*.md" \
		--exclude "*.swp" \
		--exclude "LICENSE" \
		-avh --no-perms . ~/develop/tmp;
	source $HOME/.zshrc;
}
 
# just throw everything in here for now ...
# goal - use links so can edit in place to push back
function link() {
	# fix needs to run from current directory
	pwd=`pwd`
	FILES=(
		# -F does not prevent nested omz link
		".omz"
		".vimrc" 
		".zshrc"
		".tmux.conf"
	)

	for file ($FILES) (
		ln -Ffs "$pwd/$file" "$target/$file"
	)

	# one time vim creation
	mkdir "$HOME/.vim"
	mkdir "$HOME/.vim/.backup"
	# run vim bundle install

	source "$HOME/.zshrc";
}

if [[ $1 == "--force" || $1 == "-f" ]]; then
	link;
else
	vared -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -c REPLY;
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		link;
	fi;
fi;
