# Custom edX devstack environments:

For use in development with the edX devstack, place these files in a directory
called custom-env
in your edx-platform.

*Note:* this will be cleaned out by any provisioning which may happen when
you perform a `vagrant up`, so be sure to save any needed changes made during
development back out of edx-platorm/custom-env in to your local edx-custome-envs
repository.

## Contents:

- push.envs.sh
  - *copies out devstack_custome.py to the lms and cms envs*
  - *copies the themes directory to the directory above edx-platform*
  - *copies the theme configuration variables, `theme.env.json`*
- devstack_custom.py
  - *your custom environmenet settings; builds on top of devstack*
- theme.env.json
  - *custom theme environment settings, read by your custome theme*
- themes
  - your named theme directories are placed here, and referenced by `THEME_NAME`*

## For debugging:

For debugging, you will want to add files yourself.

### WingIDE
For WingIDE, you will want to have the wing *.deb installation
file available from the same version of wing which you are running on your host.
You will want to install it in the VM (once, per VM creation).
From either the VM installation, or from your host installation, you will also
want to copy in wingdbstub.py, appropriately configured.
This, along with a wingdebugpw file which matches on both
client and VM will be copied into the same folder with your devstack_custom.py
file.

- wingdbstub.py  # supply and configure from your wingIDE installation;
- wingdebugpw    # supply and configure from your wingIDE installation;  
- wingide5_5.0.2-1_amd64.deb  # same version of your host wingide;

### Winpdb

TODO;

