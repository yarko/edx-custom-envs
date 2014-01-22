# lms/envs/devstack_custom.py
#
"""
Custom theming
"""

import json
from .devstack import *

## If using wing, this should be in your [cms,lms]/envs/ directory:
# import wingdbstub

FEATURES['USE_CUSTOM_THEME']=True

THEME_SETTINGS = 'theme.env.json'
THEME_NAME = 'stanford'  # A default theme name, from here...


# grab settings from the env file;
#
#  use CONFIG_ROOT - see aws.py;
with open(CONFIG_ROOT / THEME_SETTINGS) as env_file:
    ENV_TOKENS = json.load(env_file)

# we'll set the vars this way;
# - our check is that we assume upper+digit+_ only for keys;
# - if no var set, and note previously set - that's it.
set_vars = globals()
for K in ENV_TOKENS.keys():
    assert K.isupper()  # accepts digits & '_' as well
    set_vars[K] = ENV_TOKENS[K]

##
# Some of the ugly explicits we had before:
'''
PLATFORM_NAME = ENV_TOKENS['PLATFORM_NAME']
SITE_NAME = ENV_TOKENS['SITE_NAME']

#Theme overrides
THEME_NAME = ENV_TOKENS.get('THEME_NAME', THEME_DEFAULT)

TECH_SUPPORT_EMAIL = ENV_TOKENS.get('TECH_SUPPORT_EMAIL', TECH_SUPPORT_EMAIL)
CONTACT_EMAIL = ENV_TOKENS.get('CONTACT_EMAIL', CONTACT_EMAIL)
BUGS_EMAIL = ENV_TOKENS.get('BUGS_EMAIL', BUGS_EMAIL)

# Marketing link overrides
for key, value in ENV_TOKENS.get('MKTG_URL_LINK_MAP', {}).items():
    MKTG_URL_LINK_MAP[key] = value
'''
