if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting  ""
    fish_vi_key_bindings
    if test -f ~/.config/secrets/secrets.fish
        source ~/.config/secrets/secrets.fish
    end
    sleep 0.1; fastfetch 
    eval (direnv hook fish)

end
