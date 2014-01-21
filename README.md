# Custom edX devstack environments:

For use in development with the edX devstack, clone this repository to the directory
which contains your `Vagrantfile`.

After creating your VM, after provisioning, this directory will be accessible
from within your VM in `/vagrant/edx-custom-envs`.

*Note:*  Your edx-platform tree will be cleaned out by any provisioning which may happen when
you perform a `vagrant up`, so be sure to save any needed changes made during
development back out of edx-platform.
In fact, it’s a good idea to make changes in the repository itself, and push changes out into VM directories.


## Contents:

- push.envs.sh - *use from within your VM*
  - *copies ```devstack_*.py``` to the lms and cms envs*
  - *copies the themes directory to `/edx/app/edxapp`*
  - *copies the theme configuration variables, `theme.env.json` to `/edx/app/edxapp`*
- devstack_custom.py
  - *your custom environment settings; builds on top of devstack*
  - *any modified devstack named ```devstack_*.py``` will be pushed out - be careful not to overwrite existing names.*
- theme.env.json
  - *custom theme environment settings, read by your custom theme*
- themes
  - *your named theme directories are placed here, and referenced by `THEME_NAME`*

  
## Getting Started

Clone this repository into the same directory as your devstack Vagrantfile exists.

Clone the Stanford Theme into the themes directory here:
```
$ (cd themes; git clone https://github.com/Stanford-Online/edx-theme.git stanford)
```

From your devstack VM instance, as user edxapp, run:
```
$ /vagrant/edx-custom-theme/push.env.sh
```

Then refer to the [wiki](wiki) for further guidelines.



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

To install the wingide from the *.deb file, from within your VM,
```
sudo dpkg -i /vagrant/wingide5_5*.deb
```


### Winpdb

TODO;

