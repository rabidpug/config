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
