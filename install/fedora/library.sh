# Check if package is installed
_isInstalled() {
    package="$1";
    check=$(yum list installed | grep $package)
    if [ -z "$check" ]; then
        echo 1; #'1' means 'false' in Bash
        return; #false
    else
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi
}

# Install required packages
_installPackages() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;
    printf "Package not installed:\n%s\n" "${toInstall[@]}";
    sudo dnf install --assumeyes "${toInstall[@]}"
}
