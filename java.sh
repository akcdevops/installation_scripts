#!/bin/bash

# Install Java 8
install_java8() {
    sudo apt-add-repository -y ppa:openjdk-r/ppa
    sudo apt-get update
    sudo apt-get install -y openjdk-8-jdk
}

# Uninstall Java 8
uninstall_java8() {
    sudo apt-get remove -y openjdk-8-jdk
    sudo apt-get autoremove -y
}

# Install Java 11
install_java11() {
    sudo apt-get install -y openjdk-11-jdk
}

# Uninstall Java 11
uninstall_java11() {
    sudo apt-get remove -y openjdk-11-jdk
    sudo apt-get autoremove -y
}

# Install Java 17
install_java17() {
    sudo add-apt-repository -y ppa:linuxuprising/java
    sudo apt-get update
    sudo apt-get install -y jdk-17
}

# Uninstall Java 17
uninstall_java17() {
    sudo apt-get remove -y jdk-17
    sudo apt-get autoremove -y
}

# Install Java 21
install_java21() {
    sudo apt-get install -y openjdk-21-jdk
}

# Uninstall Java 21
uninstall_java21() {
    sudo apt-get remove -y openjdk-21-jdk
    sudo apt-get autoremove -y
}

# Prompt the user to enter the desired action and Java version
read -p "Enter action (install|uninstall): " action
read -p "Enter Java version (8|11|17|21): " java_version

# Call the appropriate function based on the input arguments
if [ "$action" == "install" ]; then
    if [ "$java_version" == "8" ]; then
        install_java8
    elif [ "$java_version" == "11" ]; then
        install_java11
    elif [ "$java_version" == "17" ]; then
        install_java17
    elif [ "$java_version" == "21" ]; then
        install_java21
    else
        echo "Invalid Java version: $java_version"
        exit 1
    fi
elif [ "$action" == "uninstall" ]; then
    if [ "$java_version" == "8" ]; then
        uninstall_java8
    elif [ "$java_version" == "11" ]; then
        uninstall_java11
    elif [ "$java_version" == "17" ]; then
        uninstall_java17
    elif [ "$java_version" == "21" ]; then
        uninstall_java21
    else
        echo "Invalid Java version: $java_version"
        exit 1
    fi
else
    echo "Invalid action: $action"
    exit 1
fi