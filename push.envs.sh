#!/usr/bin/env sh

# setup the basic starting envs,
# but rsync so as to not to
# unintentionally overwrite any dev changes

if [ "$(basename $PWD)" = "custom-env" ]
then
    # the lms
    rsync -avup devstack_apigee.py wingdbstub.py wingdebugpw ../lms/envs
    # the cms
    rsync -avup devstack_apigee.py wingdbstub.py wingdebugpw ../cms/envs

    # the theme space for devstack, assumed to be one above edx-platform:

    ###
    # TODO: add a check for existence consistent w/ devstack
    #  i.e. be sure to copy to the correct place:
    if [ "$(uname -s)" = "Linux" ]; then
	rsync -avup theme.env.json themes ../..
    fi
else
    echo "copy this directory to 'custom-env' in your 'edx-platform' tree."
fi

