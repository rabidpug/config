if status is-interactive
  fish_vi_key_bindings
  bind \e\[1\;5C forward-word
  bind \e\[1\;5D backward-word
  set -U fish_greeting "🐟"
  set -U FZF_COMPLETE 1
  function fish_user_key_bindings
    bind -M insert \t '__fzf_complete'
  end
end

 function fish_title
     tmux_directory_title $_
   end
function tmux_directory_title
  set CMD "$argv[1]"
  set DIV ":"
  if contains "$CMD" fish tmux cd exit ':q'
      set CMD "$LCMD"
    end
    if begin [ "$PWD" != "$LPWD" ]; or begin [ "$CMD" != "$LCMD" ]; and [ "$CMD" != "" ]; end; end
    set LPWD "$PWD"
    if [ "$CMD" != "" ]
      set LCMD "$CMD"
    end
    if test -z "$CMD"
      set DIV ""
    end
    set PPWD (string replace "$HOME" "~" $PWD)
    set INPUT "$CMD""$DIV""$PPWD"
    set SUBSTRING (echo $INPUT| awk '{ print substr( $0, length($0) - 19, length($0) ) }')
    tmux rename-window "$SUBSTRING"
  end
end
