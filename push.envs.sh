#!/usr/bin/env sh

# setup the basic starting envs,
# but rsync so as to not to
# unintentionally overwrite any dev changes
#
# This should be good for both devstack and fullstack VMs

if [ "$PWD" != "/vagrant/edx-custom-envs" ]; then
    echo "This should be run from your VM."
    return 1;
fi

EDXAPP=/edx/app/edxapp
PLATFORM=$EDXAPP/edx-platform

# the lms
rsync -avup devstack_*.py wingdbstub.py wingdebugpw $PLATFORM/lms/envs
# the cms
rsync -avup devstack_*.py wingdbstub.py wingdebugpw $PLATFORM/cms/envs

# the theme space for devstack, assumed to be one above edx-platform:

###
# TODO: add a check for existence consistent w/ devstack
#  i.e. be sure to copy to the correct place:
if [ "$(uname -s)" = "Linux" ]; then
    rsync -avup theme.env.json themes $EDXAPP
fi

