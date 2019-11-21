#!/bin/bash
# echo -n -e "\033]0;YOUR TITLE HERE\007"


. ./hostDetail.properties

declare -a di2List
declare -a diList
declare -a itList
declare -a qtList
declare -a uatList


envList=($envsArray)
di2List=($di2Array)
diList=($diArray)
itList=($itArray)
qtList=($qtArray)
uatList=($uatArray)


echo "Env List : ${envList[@]}"
echo
read -p "Which Env ? : " env
read -p "Which host ? : " host

declare count=0;
declare -a hostnames;
declare -r list="Array"
declare -a foundList
declare -a foundhostName
# echo ${di2List[@]} 


 for i in "${envList[@]}"
do
  if [[ "$i" == $env ]] ; then
    lname="$i$list"
    y=$(echo "${!lname}")
    #echo $(echo "${di2List[@]} ")
    hostnames=($y)
     for j in "${hostnames[@]}"
	do
   		if [[ "$j" =~ $host ]] ; then
   			a="$j"
   			x=$(echo "${!a}")
        		foundList["$count"]="$x"
        		foundhostName["$count"]="$j"
   				count=$( expr "$count" + "1")
   			echo "$count. Found $j with hostUrl= $x"
        		#echo -n -e "\033]0;$j\007"
			
    		fi
	done
  fi
done	

if [[ "$count" == 0 ]] ; then
	echo "That was wrong input try again!!"
else
    if [[ "$count" == 1 ]] ; then
    	echo
		echo "Logging in into " ${foundhostName[@]:0}  " hostaddress are" ${foundList[@]:0}  
		echo -n -e "\033]0;${foundhostName[0]}\007"	
		ssh $unixId@${foundList[0]}
    else
		echo "found $count host ....Enter 1,2,3.. as host number u want to login"	    
		read -p "Enter host numer : " hno
	 	if [[ "$hno" -gt "$count" ]] ; then
	 		echo "Sorry wrong input!!"
	 	else
	 		hno=$( expr "$hno" - "1")
	 		echo "\nLogging in into " ${foundhostName[$hno]}  " hostaddress are" ${foundList[$hno]}  
	 		echo -n -e "\033]0;${foundhostName[$hno]}\007"	
	 		ssh $unixId@${foundList[$hno]}
	 fi
    
    fi
fi

# echo $count
# echo ${foundList[@]}    


# case "$env" in 
#     #case 1 
#     "di2") echo "Hey thi is for di222" 
#  for i in "${di2List[@]}"
# do
#    if [[ "$i" =~ $host ]] ; then
#    		a="$i"
#    		x=$(echo "${!a}")
#         echo "host detail for $i is $x"
#         echo -n -e "\033]0;$i\007"
# 
# 	ssh $unixId@$x
#     fi
# done;; 
#       
#     #case 2 
#     "di") echo "Hey this will handle di condition" 
#       
# esac 

