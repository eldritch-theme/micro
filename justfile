default: write

_deploy_palette VARIANT \
    background foreground \
    current_line surface overlay \
    comment \
    cyan green yellow orange \
    pink purple red \
    keyword variable todo:
    sed \
        -e "s/@@VARIANT@@/{{VARIANT}}/g" \
        -e "s/@@BACKGROUND@@/{{background}}/g" \
        -e "s/@@FOREGROUND@@/{{foreground}}/g" \
        -e "s/@@CURRENT_LINE@@/{{current_line}}/g" \
        -e "s/@@SURFACE@@/{{surface}}/g" \
        -e "s/@@OVERLAY@@/{{overlay}}/g" \
        -e "s/@@COMMENT@@/{{comment}}/g" \
        -e "s/@@CYAN@@/{{cyan}}/g" \
        -e "s/@@GREEN@@/{{green}}/g" \
        -e "s/@@YELLOW@@/{{yellow}}/g" \
        -e "s/@@ORANGE@@/{{orange}}/g" \
        -e "s/@@PINK@@/{{pink}}/g" \
        -e "s/@@PURPLE@@/{{purple}}/g" \
        -e "s/@@RED@@/{{red}}/g" \
        -e "s/@@KEYWORD@@/{{keyword}}/g" \
        -e "s/@@VARIABLE@@/{{variable}}/g" \
        -e "s/@@TODO@@/{{todo}}/g" \
        ".eldritch-@@VARIANT@@.micro" > "themes/eldritch-{{VARIANT}}.micro"

write:
    mkdir -p themes

    # Cthulhu
    just _deploy_palette "cthulhu" \
        "#212337" "#ebfafa" \
        "#323449" "#454759" "#5b5c66" \
        "#7081d0" \
        "#04d1f9" "#37f499" "#f1fc79" "#f7c67f" \
        "#f265b5" "#a48cf2" "#f16c75" \
        "#37f499" "#04d1f9" "#37f499"

    # Abyss
    just _deploy_palette "abyss" \
        "#171928" "#d8e6e6" \
        "#252738" "#353746" "#474852" \
        "#506299" \
        "#0396b3" "#2dcc82" "#ccd663" "#d4a666" \
        "#d154a1" "#8b75d9" "#cc5860" \
        "#2dcc82" "#0396b3" "#2dcc82"

    # Dusk
    # Per SPEC, Dusk remaps only:
    #   yellow  -> orange   (strings, warnings)
    #   green   -> pink      (keywords, operators, statements)
    #   cyan    -> comment  (variables and general text)
    #   green   -> purple   (todo markers)
    # All other roles use the base Dusk palette.
    just _deploy_palette "dusk" \
        "#f0f3f4" "#1e2029" \
        "#e2e6e8" "#d5d9db" "#c9cbcd" \
        "#5b73dc" \
        "#0ad6ff" "#38ff9f" "#ffaf4d" "#ffaf4d" \
        "#fb5bb6" "#8a69f7" "#fb5b66" \
        "#fb5bb6" "#5b73dc" "#8a69f7"
