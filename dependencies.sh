# ----------------------------------------------------------
# Packages
# ----------------------------------------------------------

source share/packages/arch.sh

_installPackages() {
    toInstall=()
    for pkg; do
        echo "${pkg}"
    done
}

_installPackages "${packages[@]}"