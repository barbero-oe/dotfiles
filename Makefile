restow: update
	stow --dotfiles --ignore 'dot-local|Makefile' --target ~ --restow .
	stow --dotfiles --ignore 'dot-config|Makefile' --no-folding --target ~ --restow .
stow: init
	stow --dotfiles --ignore 'dot-local|Makefile' --target ~ --stow .
	stow --dotfiles --ignore 'dot-config|Makefile' --no-folding --target ~ --stow .
delete:
	stow --dotfiles --ignore 'dot-local|Makefile' --target ~ --delete .
	stow --dotfiles --ignore 'dot-config|Makefile' --no-folding --target ~ --delete .
update:
	git submodule update --init --recursive --filter=blob:none
