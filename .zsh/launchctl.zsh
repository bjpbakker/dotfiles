typeset -A _launchctl_services;
_launchctl_services=("postgres" "/usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist")

launch() {
    local what=$1;
    if [ -z $what ]; then
        echo "Sorry, you need to tell me what to launch";
        return 1;
    fi
    local service=${_launchctl_services[$what]}
    if [ -z $service ]; then
       echo "I don't know this service: $what";
       return 1;
    fi

    launchctl load $service;
}

unlaunch() {
    local what=$1;
    if [ -z $what ]; then
        echo "Sorry, you need to tell me what to unlaunch";
        return 1;
    fi
    local service=${_launchctl_services[$what]}
    if [ -z $service ]; then
       echo "I don't know this service: $what";
       return 1;
    fi

    launchctl unload $service;
}