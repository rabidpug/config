if status is-interactive
  set SCRN (tty)
  set sesn 'hack'
  if which tmux 2>&1 >/dev/null; and test -z "$TMUX"; and not string match -r 'tty[0-9]+$' "$SCRN"
    set TERM screen-256color
    if test "$sesn" = '${workspaceFolderBasename}'
      set sesn 'code'
    end
    set -q sesn; or set sesn 'hack'
    if tmux has-session -t $sesn 2>/dev/null
      set tpth"(realpath -e "$PWD//")"; or "(realpath -e $HOME/)"
      set mtchpne ''
      set mtchwnd =''
      tmux list-panes -t "$sesn" -s -F '#{window_id} #{pane_id} #{pane_current_path}' |
      while IFS=' ' read -r wndw pne pth;
        if test "$pth" = "$tpth"
          set mtchpne $pne
          set mtchwndw $wndw
        end
      end
      if test -z "$mtchpne"
        tmux new-window -t "$sesn" -c "$tpth"
      else
        tmux select-pane -t "$sesn:$pne"
        tmux select-window -t "$sesn:$wndw"
      end
      exec tmux attach -t "$sesn"
    else
      exec tmux new -s "$sesn"
    end
  end
end
