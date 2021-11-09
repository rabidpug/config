if status is-interactive
  fish_vi_key_bindings
  set -U fish_greeting "🐟"
  set -U FZF_COMPLETE 1
  set -U FZF_LEGACY_KEYBINDINGS 0
  function fish_user_key_bindings
    bind -M insert \t '__fzf_complete'
  end
end
