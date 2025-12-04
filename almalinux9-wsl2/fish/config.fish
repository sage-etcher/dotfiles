
#!/usr/bin/env fish

#if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

#fundle plugin 'danhper/fish-ssh-agent'
#fundle init

if status is-interactive
    # Commands to run in interactive sessions can go here

    # start tmux (`tmux` must exist and we must not alredy be in it)
    # try and attach to existing server, if no server exists, start new
    if command -v tmux >/dev/null && test -z "$TMUX"
        if ! tmux list-sessions
            exec tmux
        else
            exec tmux attach
        end
    end
end
