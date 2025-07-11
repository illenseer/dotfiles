function mc
    set SHELL_PID %self
    set MC_PWD_FILE "/tmp/mc-$USER/mc.pwd.$SHELL_PID"

    if not test -d "/tmp/mc-$USER"
        mkdir -p "/tmp/mc-$USER"
    end

    /opt/homebrew/bin/mc -d -P $MC_PWD_FILE $argv

    if test -r $MC_PWD_FILE

        set MC_PWD (cat $MC_PWD_FILE)
        if test -n "$MC_PWD"
            and test -d "$MC_PWD"
            cd (cat $MC_PWD_FILE)
        end

        rm -f $MC_PWD_FILE
    end
end
