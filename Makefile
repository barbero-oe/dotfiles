restow: init
	stow --dotfiles --ignore Makefile --target ~ --restow .
stow: init
	stow --dotfiles --ignore Makefile --target ~ --stow .
delete:
	stow --dotfiles --ignore Makefile --target ~ --delete .
init:
	git submodule update --init
