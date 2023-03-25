if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \e\[3\;5~ kill-word
bind \cH backward-kill-word
bind \cV beginning-of-line
bind \f end-of-line
