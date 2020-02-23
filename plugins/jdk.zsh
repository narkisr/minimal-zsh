# JDK environment setup
if [ -d  /usr/lib/jvm/java-1.8.0-amazon-corretto/ ]; then
  export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto/
elif [ -d /usr/lib/jvm/java-11-amazon-corretto/ ]; then
  export JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto/
fi

export JDK_HOME=$JAVA_HOME
export LEIN_JAVA_CMD=/usr/bin/java
