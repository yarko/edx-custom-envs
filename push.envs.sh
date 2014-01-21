#!/usr/bin/env bash

# setup the basic starting envs,
# but rsync so as to not to
# unintentionally overwrite any dev changes
#
# This should be good for both devstack and fullstack VMs

CUSTOM=/vagrant/edx-custom-envs

EDXAPP=/edx/app/edxapp
EDX_PLATFORM=$EDXAPP/edx-platform

if [ "${0%/*}" != "${CUSTOM}" ] || [ "$(uname -s)" != "Linux" ]; then
    echo "This should be run from your VM."
    return 1;
fi

# the lms
rsync -avup ${CUSTOM}/devstack_*.py $EDX_PLATFORM/lms/envs
# the cms
rsync -avup ${CUSTOM}/devstack_*.py $EDX_PLATFORM/cms/envs

# the theme space for devstack, assumed to be one above edx-platform:
rsync -avup ${CUSTOM}/theme.env.json ${CUSTOM}/themes $EDXAPP

