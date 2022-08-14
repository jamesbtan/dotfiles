function fish_prompt
    set -l stat $pipestatus
    # Shorten pwd if prompt is too long
    set -l pwd (prompt_pwd)
    if test $stat -eq 0 -o $stat -eq 141
        printf "%s: " $pwd
    else
        set -l ccolor (set_color red)
        set -l restore (set_color normal)
        printf "%s: %s[%s]%s " $pwd $ccolor $stat $restore
    end

end
