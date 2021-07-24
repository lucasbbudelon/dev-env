printf '\n\e[1m%-10s \t %-10s \t %-10s \t \e[0m\n' NAME VERSION STATUS

while read item; do

    version=($(${item} --version "exit" 2> /dev/null | egrep -o "([0-9]+).([0-9]+).([0-9]+)"))

    if [[ $version == "" ]]; then
        printf '%-10s \t %-10s \t %-1s \e[31m\xE2\x9D\x8C\e[39m \n' $item - not-found
    else
        printf '%-10s \t %-10s \t %-1s \e[32m\xE2\x9C\x94\e[39m \n' $item $version ok
    fi

done < environment

echo -e "\e[39m\e[0m"