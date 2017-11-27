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


###Function To print and insert the output>>

print_options()
        {
        COUNT=1
        while read VAR1
        do
                echo -n -e "[$COUNT] $VAR1\n"
                COUNT=$(( $COUNT+1 ))
                done < $1 
        echo -n -e "\n"
        }
insert_options()
        {
        COUNT=1
        while read line
        do
                ARR[$COUNT]=$line
                COUNT=$(( $COUNT+1 ))
        done < $1
        }


#####

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
		
		psql -U postgres -d demo -t -c "drop table $TMP_TABLE"
		echo -n -e "some funtion to be written \n"
	else 
		echo -n -e "INVALID OPTION" 
		usage_filter_servers
	fi
}


generator_allocation()
{

options()
        {

        read VAR2
        for ((i=1; i<=${#ARR[@]}; i++)) ;
        do  
                if [[ $VAR2 -eq $i ]]; then
                FILTER=${ARR[$i]}
                fi
        done
        }

echo -n -e "select team you want to allocate generator"

team

echo -n -e "select channel for team $FILTER_TEAM"

channel

echo -n -e "Following controller machines are dedicated to $FILTER_CHANNEL channel of $FILTER_TEAM \n"

psql -X  -U postgres -d demo -t -c "select server_name,  server_ip, blade_name from $TMP_TABLE where  machine_type='Controller'" > controller.temp

print_options controller.temp
insert_options controller.temp

options 

echo -n -e "Following are the Dedicated generators for this machine and blade.\n"
psql  -X  -U postgres -d demo -t -c "select server_name, server_ip, blade_name from $TMP_TABLE where team='$FILTER_TEAM' and channel='$FILTER_CHANNEL' and machine_type='Generator'" | tee dedicated_$FILTER_TEAM.list; sed -i -r 's/\s+//g' dedicated_$FILTER_TEAM.list
echo -n -e "\nFollowing are the free Generators\n"
psql  -X  -U postgres -d demo -t -c "select server_name, server_ip, blade_name from allocation where allocation='Free'"| tee free_$FILTER_TEAM.list;sed -i -r 's/\s+//g' free_$FILTER_TEAM.list


}


allocation()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct allocation from allocation' > allocation.temp
print_options allocation.temp
insert_options allocation.temp
C=1
select_options()
{
read VAR2
for ((i=1; i<=${#ARR[@]}; i++)) ;
do  
	if [[ $VAR2 -eq $i ]]; then
	FILTER_ALLOCATION=${ARR[$i]}
	fi
done
echo "more??(y or n)"
read ANS
if [[ "xx$ANS" == "xxy" ]] || [[ "$ANS" == "xxY" ]] ; 
then
	ALLOCATION[$C]=" allocation='$FILTER_ALLOCATION' or"
	C=$(( $C+1 ))
	select_options
elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
then 
	ALLOCATION[$C]=" allocation='$FILTER_ALLOCATION'"
else 
	echo "INVALID OPTION"
fi
}
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${ALLOCATION[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"


rm allocation.temp	
}

ubuntu_version()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct ubuntu_version from allocation' > ubuntu_version.temp
C=1
print_options ubuntu_version.temp
insert_options ubuntu_version.temp
	select_options()
	{
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2 -eq $i ]]; then
		FILTER_VERSION=${ARR[$i]}
		fi
	done
	echo  "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		VERSION[$C]=" ubuntu_version='$FILTER_VERSION' or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]] ; 
	then
		VERSION[$C]=" ubuntu_version='$FILTER_VERSION'"
	else 
		echo "INVALID OPTION"
	fi
	}
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${TEAM[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

rm ubuntu_version.temp
}

machine_type()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct machine_type from allocation' > machine.temp
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2 -eq $i ]]; then
		FILTER_MACHINE=${ARR[$i]}
		fi
	done
	
	echo "more??(y or n)"
	read ANS
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		MACHINE[$C]=" machine_type='$FILTER_MACHINE' or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		MACHINE[$C]=" machine_type='$FILTER_MACHINE'"
	else
		echo "INVALID OPTION"
	fi
	}
C=1

print_options machine.temp
insert_options machine.temp
select_options


TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${MACHINE[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

rm machine.temp	
}

channel()
{
echo -n -e "Please select option\n"
if [ $VAR -eq 1 ];
then
	psql -X -A -U postgres -d demo -t -c 'select distinct channel from allocation' > channel.temp
else 
	psql -X -A -U postgres -d demo -t -c "select distinct channel from $TMP_TABLE" > channel.temp
fi

	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2 -eq $i ]]; then
		FILTER_CHANNEL=${ARR[$i]}
		fi
	done
	if [ $VAR -eq 1 ];
        then

                echo "more??(y or n)"
                read ANS
        else
                ANS='n'
        fi

	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		CHANNEL[$C]=" channel='$FILTER_CHANNEL' or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		CHANNEL[$C]=" channel='$FILTER_CHANNEL'"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options channel.temp
insert_options channel.temp
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${CHANNEL[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"
rm channel.temp
}

team()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct team from allocation' > team.temp
	select_options()
	{
	
	read VAR2
	for ((i=1; i<=${#ARR[@]}; i++)) ;
	do  
		if [[ $VAR2 -eq $i ]]; then
		FILTER_TEAM=${ARR[$i]}
		fi
	done
	if [ $VAR -eq 1 ];
	then
			
		echo "more??(y or n)"
		read ANS
	else 
		ANS='n'
	fi
	if [[ "xx$ANS" == "xxy" ]] || [[ "xx$ANS" == "xxY" ]] ; 
	then
		TEAM[$C]=" team='$FILTER_TEAM' or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		TEAM[$C]=" team='$FILTER_TEAM'"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options team.temp
insert_options team.temp
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${TEAM[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

rm team.temp	
}

owner()
{
echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct owner from allocation' > owner.temp
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
		OWNER[$C]=" owner='$FILTER_OWNER' or"
		C=$(( $C+1 ))
		select_options
	elif [[ "xx$ANS" == "xxn" ]] || [[ "$ANS" == "xxN" ]]; 
	then
		OWNER[$C]=" owner='$FILTER_OWNER'"
	else 
		echo "INVALID OPTION"
	fi
	}
C=1
print_options owner.temp
insert_options owner.temp
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${OWNER[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"


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


TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where status='$STATUS'"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"

}

server_type()
{

echo -n -e "Please select option\n"
psql -X -A -U postgres -d demo -t -c 'select distinct server_type from allocation' > server.temp
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
print_options server.temp
insert_options server.temp
select_options

TMP_TABLE1="tmp_Demo"
psql -U postgres -d demo -t -c "create table $TMP_TABLE1 as select * from $TMP_TABLE"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE"

TEMP=${SERVER[@]}
psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from $TMP_TABLE1 where $TEMP"
psql -U postgres -d demo -t -c "drop table $TMP_TABLE1"


rm server.temp
}

usage_root				#Main execution start
read VAR

TMP_TABLE="demo_try"

psql -U postgres -d demo -t -c "create table $TMP_TABLE as select * from allocation"
case "$VAR" in
	1)filter_servers ;;
	2)generator_allocation ;;
	3) generator_deallocation ;;
	4) update_server_details ;;
	*) echo "INVALID OPTION" 
	usage_root ;;
esac
