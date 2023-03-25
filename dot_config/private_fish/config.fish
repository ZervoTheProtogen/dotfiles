if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \e\[3\;5~ kill-word
bind \cH backward-kill-word
