restow:
	stow --dotfiles --ignore Makefile --target ~ --restow .
stow:
	stow --dotfiles --ignore Makefile --target ~ --stow .

delete:
	stow --dotfiles --ignore Makefile --target ~ --delete .
