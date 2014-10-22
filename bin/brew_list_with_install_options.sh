#!/bin/sh

#
# Lists installed formulas with install options.
#
# E.g.
#   vim --override-system-vi
#

grab_install_options() {
    local formula=$1
    info=`brew info $formula 2>&1`
    if [ $? -ne 0 ]; then
        return 1
    else
        echo "$info" \
            | awk /Built\ from\ source\ with:/'{gsub("  Built from source with: ", ""); print}' \
            | awk '{gsub(",", ""); print}'
        return 0
    fi
}

print_with_install_options() {
    local formula=$1
    install_options=`grab_install_options $formula`
    local was_successful=$?
    if [ $was_successful -eq 0 ]; then
        echo $formula $install_options
    else
        echo >&2 "Unknown formula: $formula"
    fi
}

main() {
    if [ $# -eq 0 ]; then
        local formulas=`brew list`
    else
        local formulas=$*
    fi

    for formula in $formulas; do
        print_with_install_options $formula
    done
}

main $*
