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
<<<<<<< HEAD
		
		psql -U postgres -d demo -t -c "drop table $TMP_TABLE"
=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		echo -n -e "some funtion to be written \n"
	else 
		echo -n -e "INVALID OPTION" 
		usage_filter_servers
	fi
}

<<<<<<< HEAD

=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD
	if [[ $VAR2 -eq $i ]]; then
=======
	if [[ $VAR2==$i ]]; then
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	FILTER_ALLOCATION=${ARR[$i]}
	fi
done
echo "more??(y or n)"
read ANS
if [[ "xx$ANS" == "xxy" ]] || [[ "$ANS" == "xxY" ]] ; 
then
<<<<<<< HEAD
	ALLOCATION[$C]=" allocation='$FILTER_ALLOCATION' or"
=======
	ALLOCATION[$C]=" allocation=$FILTER_ALLOCATION or"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	C=$(( $C+1 ))
	select_options
elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
then 
<<<<<<< HEAD
	ALLOCATION[$C]=" allocation='$FILTER_ALLOCATION'"
=======
	ALLOCATION[$C]=" allocation=$FILTER_ALLOCATION"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
else 
	echo "INVALID OPTION"
fi
}
select_options
<<<<<<< HEAD

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${ALLOCATION[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"


=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD
		if [[ $VAR2 -eq $i ]]; then
=======
		if [[ $VAR2==$i ]]; then
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		FILTER_VERSION=${ARR[$i]}
		fi
	done
	echo  "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
<<<<<<< HEAD
		VERSION[$C]=" ubuntu_version='$FILTER_VERSION' or"
=======
		VERSION[$C]=" allocation=$FILTER_VERSION or"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]] ; 
	then
<<<<<<< HEAD
		VERSION[$C]=" ubuntu_version='$FILTER_VERSION'"
=======
		VERSION[$C]=" allocation=$FILTER_VERSION"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	else 
		echo "INVALID OPTION"
	fi
	}
select_options
<<<<<<< HEAD

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${TEAM[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD
		if [[ $VAR2 -eq $i ]]; then
=======
		if [[ $VAR2==$i ]]; then
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		FILTER_MACHINE=${ARR[$i]}
		fi
	done
	
	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
<<<<<<< HEAD
		MACHINE[$C]=" machine_type='$FILTER_MACHINE' or"
=======
		MACHINE[$C]=" allocation=$FILTER_MACHINE or"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
<<<<<<< HEAD
		MACHINE[$C]=" machine_type='$FILTER_MACHINE'"
=======
		MACHINE[$C]=" allocation=$FILTER_MACHINE"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	else
		echo "INVALID OPTION"
	fi
	}
C=1
<<<<<<< HEAD

print_options
insert_options
select_options


TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${MACHINE[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

=======
print_options
insert_options
select_options
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD
		if [[ $VAR2 -eq $i ]]; then
=======
		if [[ $VAR2==$i ]]; then
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		FILTER_CHANNEL=${ARR[$i]}
		fi
	done

	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
<<<<<<< HEAD
		CHANNEL[$C]=" channel='$FILTER_CHANNEL' or"
=======
		CHANNEL[$C]=" allocation=$FILTER_CHANNEL or"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
<<<<<<< HEAD
		CHANNEL[$C]=" channel='$FILTER_CHANNEL'"
=======
		CHANNEL[$C]=" allocation=$FILTER_CHANNEL"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
<<<<<<< HEAD

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${CHANNEL[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD
		if [[ $VAR2 -eq $i ]]; then
=======
		if [[ $VAR2==$i ]]; then
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		FILTER_TEAM=${ARR[$i]}
		fi
	done
	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
<<<<<<< HEAD
		TEAM[$C]=" team='$FILTER_TEAM' or"
=======
		TEAM[$C]=" allocation=$FILTER_TEAM or"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
<<<<<<< HEAD
		TEAM[$C]=" team='$FILTER_TEAM'"
=======
		TEAM[$C]=" allocation=$FILTER_TEAM"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
<<<<<<< HEAD

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${TEAM[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
rm team.temp	
}

owner()
{
echo -n -e "Please select option\n"
<<<<<<< HEAD
psql -X -A -U postgres -d demo -t -c 'select distinct owner from allocation' > owner.temp
=======
psql -X -A -U postgres -d demo -t -c 'select distinct owner allocation from allocation' > owner.temp
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD
		if [[ $VAR2 -eq $i ]]; then
=======
		if [[ $VAR2==$i ]]; then
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		FILTER_OWNER=${ARR[$i]}
		fi
	done

	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
<<<<<<< HEAD
		OWNER[$C]=" owner='$FILTER_OWNER' or"
=======
		OWNER[$C]=" allocation=$FILTER_OWNER or"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
<<<<<<< HEAD
		OWNER[$C]=" owner='$FILTER_OWNER'"
=======
		OWNER[$C]=" allocation=$FILTER_OWNER"
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options
<<<<<<< HEAD

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${OWNER[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"


=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
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
<<<<<<< HEAD


TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where status='$STATUS'"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
}

server_type()
{
<<<<<<< HEAD

echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct server_type from allocation' > server.temp
	print_options()
	{
	COUNT=1
	while read VAR1
	do 
		echo -n -e "[$COUNT] $VAR1\n"
		COUNT=$(( $COUNT+1 ))
		done < server.temp
	echo -n -e "\n"
	}
	insert_options()
	{
	COUNT=1
	while read line
	do 
		ARR[$COUNT]=$line
		COUNT=$(( $COUNT+1 ))
	done < server.temp
	}
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2 -eq $i ]]; then
		FILTER_OWNER=${ARR[$i]}
		fi
	done

	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		SERVER[$C]=" owner='$FILTER_OWNER' or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		SERVER[$C]=" owner='$FILTER_OWNER'"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options
insert_options
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${SERVER[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

#echo -n -e "[1] CC"
#echo -n -e "[2] VP"
#echo -n -e "[3] VM"
#read ANS
#if [[ "xx$ANS"=="xx1" ]] ;
#then
#	SERVER=CC
#elif [[ "xx$ANS"=="xx2" ]] ;
#then
#	SERVER=VP
#elif [[ "xx$ANS"=="xx3" ]] ;
#then
#	SERVER=VM
#else 
#	echo -n -e "INVALID OPTION\n"
#fi
#

rm server.temp
=======
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
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
}

usage_root				#Main execution start
read VAR
<<<<<<< HEAD

TMP_TABLE="demo_try"

psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from my_allocation"

=======
>>>>>>> 6d44eb5c1398e3e43c579e641217a16abdba23fe
case "$VAR" in
	1)filter_servers ;;
	2)generator_allocation ;;
	3) generator_deallocation ;;
	4) update_server_details ;;
	*) echo "INVALID OPTION" 
	usage_root ;;
esac

