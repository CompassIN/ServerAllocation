#bin/bash
#Written by : Gyanendra Veeru
#Purpose : To automate generator allocation and maintainence process.

usage_root()
{
	echo -n -e "Please select feature\n"
	echo -n -e "[1] Filter servers\n"
	echo -n -e "[2] Generator Allocation\n"
	echo -n -e "[3] Generator Deallocation\n"
	echo -n -e "[4] Update Server details\n"
	echo -n -e "\n"
}

usage_filter_servers()
{
echo -n -e "[1] ubuntu_version \n"
echo -n -e "[2] machine_type \n"
echo -n -e "[3] status \n"
echo -n -e "[4] channel \n"
echo -n -e "[5] team \n"
echo -n -e "[6] owner \n"
echo -n -e "[7] allocation \n"
echo -n -e "[8] build_version \n"
echo -n -e "[9] server_type \n"
}

filter_servers()
{
usage_filter_servers
read FILTER_CRITERIA
case $FILTER_CRITERIA in 
	1) ubuntu_version ;;
	2) machine_type ;;
	3) status ;;
	4) channel ;;
	5) team ;;
	6) owner ;;
	7) allocation ;;
	8) build_version ;;
	9) server_type ;;
	*) echo "INVALID OPTION" usage_filter_servers ;;
esac

	echo "Enter y if you want to add more filters else enter n"
	read MORE
	if [[ "xx$MORE" == "xxy" ]] || [[ "xx$MORE" == "xxY" ]];
	then
		filter_servers
	elif [[ "xx$MORE" == "xxn" ]] || [[ "xx$MORE" == "xxN" ]];
	then
		echo -n -e "some funtion to be written \n"
	else 
		echo -n -e "INVALID OPTION" 
		usage_filter_servers
	fi
}

allocation()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct allocation from allocation' > allocation.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < allocation.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < allocation.temp
	}
print_options
insert_options
C=1
select_options()
{
read VAR2
for ((i=1; i<=${#ARR[@]}; i++)) ;
do  
	if [[ $VAR2==$i ]]; then
	FILTER_ALLOCATION=${ARR[$i]}
	fi
done
echo "more??(y or n)"
read ANS
if [[ "xx$ANS" == "xxy" ]] || [[ "$ANS" == "xxY" ]] ; 
then
	ALLOCATION[$C]=" allocation=$FILTER_ALLOCATION or"
	C=$(( $C+1 ))
	select_options
elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
then 
	ALLOCATION[$C]=" allocation=$FILTER_ALLOCATION"
else 
	echo "INVALID OPTION"
fi
}
select_options
rm allocation.temp	
}

ubuntu_version()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct ubuntu_version from allocation' > ubuntu_version.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < ubuntu_version.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < ubuntu_version.temp
	}
C=1
print_options
insert_options
	select_options()
	{
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2==$i ]]; then
		FILTER_VERSION=${ARR[$i]}
		fi
	done
	echo  "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		VERSION[$C]=" allocation=$FILTER_VERSION or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]] ; 
	then
		VERSION[$C]=" allocation=$FILTER_VERSION"
	else 
		echo "INVALID OPTION"
	fi
	}
select_options
rm ubuntu_version.temp
}

machine_type()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct machine_type from allocation' > machine.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < machine.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < machine.temp
	}
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2==$i ]]; then
		FILTER_MACHINE=${ARR[$i]}
		fi
	done
	
	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		MACHINE[$C]=" allocation=$FILTER_MACHINE or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		MACHINE[$C]=" allocation=$FILTER_MACHINE"
	else
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
rm machine.temp	
}

channel()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct channel from allocation' > channel.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < channel.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < channel.temp
	}
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2==$i ]]; then
		FILTER_CHANNEL=${ARR[$i]}
		fi
	done

	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		CHANNEL[$C]=" allocation=$FILTER_CHANNEL or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		CHANNEL[$C]=" allocation=$FILTER_CHANNEL"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
rm channel.temp
}

team()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct team from allocation' > team.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < team.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < team.temp
	}
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2==$i ]]; then
		FILTER_TEAM=${ARR[$i]}
		fi
	done
	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		TEAM[$C]=" allocation=$FILTER_TEAM or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		TEAM[$C]=" allocation=$FILTER_TEAM"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
rm team.temp	
}

owner()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct owner allocation from allocation' > owner.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < owner.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < owner.temp
	}
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2==$i ]]; then
		FILTER_OWNER=${ARR[$i]}
		fi
	done

	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		OWNER[$C]=" allocation=$FILTER_OWNER or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		OWNER[$C]=" allocation=$FILTER_OWNER"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
rm owner.temp	
}

build_version()
{
echo -n -e "Enter Build version in the format '4.1.6 (build# 58)'"
read BUILD
}

status()
{
echo -n -e "[1] ON \n"
echo -n -e "[2] OFF \n"

read FILTER_STATUS
if [[ "xx$FILTER_STATUS" == "xx1" ]] ; 
then
	STATUS=t
elif [[ "xx$FILTER_STATUS" == "xx2" ]] ; 
then
	$STATUS=f
else 
echo -n -e "INVALID OPTION \n"
fi
}

server_type()
{
echo -n -e "[1] CC"
echo -n -e "[2] VP"
echo -n -e "[3] VM"
read ANS
if [[ "xx$ANS"=="xx1" ]] ;
then
	SERVER=CC
elif [[ "xx$ANS"=="xx2" ]] ;
then
	SERVER=VP
elif [[ "xx$ANS"=="xx3" ]] ;
then
	SERVER=VM
else 
	echo -n -e "INVALID OPTION\n"
fi
}

usage_root				#Main execution start
read VAR
case "$VAR" in
	1)filter_servers ;;
	2)generator_allocation ;;
	3) generator_deallocation ;;
	4) update_server_details ;;
	*) echo "INVALID OPTION" 
	usage_root ;;
esac

