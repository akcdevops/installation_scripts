#!/bin/bash
# apt install openjdk-11-jre-headless  # version 11.0.20.1+1-0ubuntu1~22.04, or
# apt install default-jre              # version 2:1.11-72build2
# apt install openjdk-17-jre-headless  # version 17.0.8.1+1~us1-0ubuntu1~22.04
# apt install openjdk-18-jre-headless  # version 18.0.2+9-2~22.04
# apt install openjdk-19-jre-headless  # version 19.0.2+7-0ubuntu3~22.04
# apt install openjdk-8-jre-headless   # version 8u382-ga-1~22.04.1
# Install Java 8
install_java8() {
    sudo apt-get update
    sudo openjdk-8-jre-headless -y
}

# Uninstall Java 8
uninstall_java8() {
    sudo apt-get remove -y openjdk-8-jre-headless
    sudo apt-get autoremove -y
}

# Install Java 11
install_java11() {
    sudo apt-get install openjdk-11-jre-headless -y
}

# Uninstall Java 11
uninstall_java11() {
    sudo apt-get remove openjdk-11-jre-headless -y
    sudo apt-get autoremove -y
}

# Install Java 17
install_java17() {
    sudo apt-get update
    sudo apt-get install openjdk-17-jre -y
}

# Uninstall Java 17
uninstall_java17() {
    sudo apt-get remove openjdk-17-jre -y
    sudo apt-get autoremove -y
}



# Prompt the user to enter the desired action and Java version
read -p "Enter action (install|uninstall): " action
read -p "Enter Java version (8|11|17): " java_version

# Call the appropriate function based on the input arguments
if [ "$action" == "install" ]; then
    if [ "$java_version" == "8" ]; then
        install_java8
    elif [ "$java_version" == "11" ]; then
        install_java11
    elif [ "$java_version" == "17" ]; then
        install_java17
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
    else
        echo "Invalid Java version: $java_version"
        exit 1
    fi
else
    echo "Invalid action: $action"
    exit 1
fi