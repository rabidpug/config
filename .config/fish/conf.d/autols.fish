
function ls_on_pwd_change --on-variable PWD
  set --local content (ls -a)
  test (count $content) -lt 25 && printf "%s\n" && ls -a
end
