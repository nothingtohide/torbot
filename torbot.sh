#!/bin/sh

#############################################################################
# Version 0.1-DEVELOPMENT (10-08-2019)
#############################################################################

#############################################################################
# Torbot - a Tor relay manager for FreeBSD
# Copyright 2019 Nozel/Sebas Veeke.
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 3 as published
# by the Free Software Foundation.
#
# You should have received a copy of the GNU General Public License along
# with this program. If not, see <https://www.gnu.org/licenses/>.
#
# Contact:
# > e-mail      mail@nozel.org
# > GitHub      nozel-org
#############################################################################

#############################################################################
# VARIABLES
#############################################################################
# torbot version
TORBOT_VERSION='0.1'

#############################################################################
# ARGUMENTS
#############################################################################

# save amount of arguments for validity check
ARGUMENTS="${#}"

# populate validation variables with zero
ARGUMENT_OPTION='0'
ARGUMENT_FEATURE='0'

# populate argument variables based on used arguments
while test -n "$1"; do
    case "$1" in
        # options
        --version)
            ARGUMENT_VERSION='1'
            ARGUMENT_OPTION='1'
            shift
            ;;

        --help|-help|help|--h|-h)
            ARGUMENT_HELP='1'
            ARGUMENT_OPTION='1'
            shift
            ;;

        # other
        *)
            ARGUMENT_NONE='1'
            shift
            ;;
    esac
done

#############################################################################
# ERROR FUNCTIONS
#############################################################################

function error_invalid_option {
    echo 'torbot: invalid option'
    echo "Use 'torbot --help' for a list of valid arguments."
    exit 1
}

function error_wrong_number_of_arguments {
    echo 'torbot: wrong number of arguments'
    echo "Use 'torbot --help' for a list of valid arguments."
    exit 1
}

function error_not_yet_implemented {
    echo 'torbot: this feature has not been implemented yet.'
    exit 1
}

function error_os_not_supported {
    echo 'torbot: operating system is not supported.'
    exit 1
}

function error_not_available {
    echo 'torbot: option or method is not available without the torbot configuration file.'
    exit 1
}

function error_no_feature_and_method {
    echo 'torbot: feature requires a method and vice versa'
    echo "Use 'torbot --help' for a list of valid arguments."
    exit 1
}

function error_options_cannot_be_combined {
    echo 'torbot: options cannot be used with features or methods'
    echo "Use 'torbot --help' for a list of valid arguments."
    exit 1    
}

function error_no_root_privileges {
    echo 'torbot: you need to be root to perform this command'
    echo "use 'sudo torbot', 'sudo -s' or run torbot as root user."
    exit 1
}

function error_no_internet_connection {
    echo 'torbot: access to the internet is required.'
    exit 1
}

function error_type_yes_or_no {
    echo "torbot: type yes or no and press enter to continue."
}

#############################################################################
# REQUIREMENT FUNCTIONS
#############################################################################

#############################################################################
# MANAGEMENT FUNCTIONS
#############################################################################

function torbot_version {
    echo "Torbot ${torbot_VERSION}"
    echo "Copyright (C) 2019 Nozel."
    echo
    echo "This program is free software: you can redistribute it and/or modify it"
    echo "under the terms of the GNU General Public License version 3 as published"
    echo "by the Free Software Foundation."
    echo
    echo "Written by Sebas Veeke"
}

function torbot_help {
    echo "Usage:"
    echo " torbot [feature]..."
    echo
    echo "Features:"
    echo " -o, --overview        Show server overview"
    echo
    echo "Options:"
    echo " --install            Installs Torbot on the system and unlocks all features"
    echo " --upgrade            Upgrade Torbot to the latest stable version"
    echo " --uninstall          Uninstalls Torbot from the system"
    echo " --help               Display this help and exit"
    echo " --version            Display version information and exit"
}

#############################################################################
# FEATURE FUNCTIONS
#############################################################################

#############################################################################
# MAIN FUNCTION
#############################################################################

function torbot_main {
    # options
    if [ "${ARGUMENT_VERSION}" == '1' ]; then
        torbot_version
    elif [ "${ARGUMENT_HELP}" == '1' ]; then
        torbot_help
    fi
}

#############################################################################
# CALL MAIN FUNCTION
#############################################################################

# call main function
torbot_main
