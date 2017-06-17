#!/bin/bash

# jfon: import aliases
source ~/.bash_aliases

# jfon: update because of shitty homebrew cask migration
# see https://github.com/caskroom/homebrew-cask/issues/21913
#export HOMEBREW_CASK_OPTS=--caskroom=/opt/homebrew-cask/Caskroom

# jfon: from maximum-awesome
export PATH="~/bin:$PATH"
# jfon: from maximum-awesome, tmux config is available at:
# /usr/local/opt/tmux/share/tmux
# jfon: from maximum-awesome, bash completion is installed at:
# /usr/local/etc/bash_completion.d

# jfon: auto complete git commands
# from https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
source ~/git-completion.bash

# jfon: Latex style checker from https://github.com/vvcogo/style-check-html
export PATH="/Users/jfon/src/style-check-html:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jfon/.sdkman"
[[ -s "/Users/jfon/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jfon/.sdkman/bin/sdkman-init.sh"

# distributary: Rust env path variable.
source $HOME/.cargo/env

# distributary: Export OpenSSL headers for Mac OS X build.
export DEP_OPENSSL_INCLUDE=/usr/local/opt/openssl/include
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include

# jfon: For Spark binaries.
export SPARK_HOME="/usr/local/spark-2.0.2"
export PATH="$PATH:$SPARK_HOME/bin"

# jfon: For Flink binaries.
# From https://sharubhat.gitbooks.io/serverside-developer-notes/content/part5/topic5/install-instructions-for-mac.html
alias start-flink='/usr/local/flink-1.2.0/bin/start-local.sh'
alias stop-flink='/usr/local/flink-1.2.0/bin/stop-local.sh'
alias flink='/usr/local/flink-1.2.0/bin/flink'

# jfon: For Apache Cassandra.
export PATH="$PATH:/usr/local/apache-cassandra-3.10/bin"
alias start-cassandra='/usr/local/apache-cassandra-3.10/bin/cassandra -f'

# jfon: Prometheus's install dir.
export PROMETHEUS_HOME="/usr/local/prometheus-1.6.1.darwin-amd64"

# jfon: Apache Kafka's install dir.
export KAFKA_HOME="/usr/local/confluent-3.2.1"
