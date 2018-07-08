#!/bin/sh	
hostname=`hostname`
user=`whoami`


printEstimatedTime(){
	#print the time taken
	runtime=$(($2-$1))
	seconds=`printf '%dh:%dm:%ds' $(($runtime/3600)) $(($runtime%3600/60)) $(($runtime%60))`
	echo -e "It took \e[1;31;42m$seconds\e[0m to process the request"
}

displayCountDown(){
echo -e "\e[41mExecuting the command in 10 seconds, press any key to stop\e[0m"
        second=10
        while [[ $second > 0 ]]; do
                tput el
                echo -ne "$second\r"
                second=$(($second-1))
                read -s -n 1 -t 1 key
                if [[ $? -eq 0 ]]; then
                        echo -e 'proceeding to next task after user entry'
                        exit 0
                fi
        done
}

