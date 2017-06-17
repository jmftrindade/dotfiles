#!/bin/bash

# jfon: import bash_rc
source ~/.bashrc

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# added by Anaconda3 4.1.1 installer
export PATH="//anaconda/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jfon/.sdkman"
[[ -s "/Users/jfon/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jfon/.sdkman/bin/sdkman-init.sh"
