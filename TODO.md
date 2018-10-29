TODO
====

NValt dans mon shell
--------------------

- tester <https://medium.com/adorableio/simple-note-taking-with-fzf-and-vim-2a647a39cfa>: directement
  accessible dans le shell, non dépendant de l'éditeur. Privilégier cette approche à celle qui suit.
- tester <https://github.com/Alok/notational-fzf-vim> pour alternative a nvalt dans vim

    nvim "$(fd --type f | fzf --preview="mdv -x -c 74 {}" --preview-window=right:60%:wrap)"
- utiliser [tmux-vim](https://github.com/sdt/tmux-vim) (create a persistent vim pane within a tmux window)

- <del>`ag` pour la recherche de fichiers <https://statico.github.io/vim3.html></del>
  `rg` pour la recherche de fichiers 

Terminal
--------

- optimiser mon usage de FZF <https://github.com/junegunn/fzf/wiki/Examples>
- basculer progressivement sur le terminal d'osx : il est plus réactif
- <del>utiliser [gruvbox](https://github.com/morhetz/gruvbox) de manière plus complète:</del>
  non, c'est compliqué et ça marchera pas avec urxvt… continuer avec base16 et les themes gruv
  - ajouter des raccourcis pour switcher black/light pour mes besoins en ascii,
    mais aussi quand j'utilise Goyo
  - étendre l'usage de ce thème : <https://github.com/morhetz/gruvbox-contrib>
    à noter le support complet pour i3 ! <https://github.com/a-schaefers/i3-wm-gruvbox-theme>

Ripreg
------

Mieux l'exploiter avec FZF et dans le shell en général

- <https://github.com/BurntSushi/ripgrep>
- <https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2>


Vim
---

- optimiser mon usage de FZF <https://github.com/junegunn/fzf#vim-plugin>
- <del>passer à [lightline](https://github.com/itchyny/lightline.vim) : plus léger, plus simple que Airline</del>
  pas génial finalement (besoin d'un autre plugin pour la barre des buffers
- utiliser [taskpaper.vim](https://github.com/davidoc/taskpaper.vim) pour mes TODOs

Writing Env
-----------

- Tester <https://github.com/amix/vim-zenroom2>


Ressources
----------

- beaucoup de bonnes choses à prendre dans <https://statico.github.io/vim3.html>. On a une manière très
  similaire de faire.


Music
-----

- utiliser [beets](http://beets.io/) pour gérer ma bibliothèque, corriger les noms de fichiers, metadata…
- 

Autres
-------

- installer [pyenv](https://github.com/pyenv/pyenv) pour éviter des problèmes avec les multiples versions de python
- vim: 
  - <https://github.com/sheerun/vim-polyglot> plutôt que pleins de plugins pour le support de plein de languages
  - <https://github.com/editorconfig/editorconfig-vim>
- replace `nhdaly/tmux-scroll-copy-mode` with `NHDaly/tmux-better-mouse-mode` or even remove it if not necessary
- test 
  - <https://github.com/tmux-plugins/tmux-sidebar>
  - <https://github.com/tmux-plugins/tmux-urlview>
  - <https://github.com/tmux-plugins/tmux-fpp>
  - <https://github.com/tmux-plugins/tmux-battery> @done
- automatically restore NeoVim session with `tmux-ressurect` (<https://github.com/tmux-plugins/tmux-resurrect/blob/master/docs/restoring_vim_and_neovim_sessions.md>) and [vim-obsession](https://github.com/tpope/vim-obsession)



