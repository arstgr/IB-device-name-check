#!/bin/bash

export wdir=$(pwd)
sudo yum install pssh -y
#sudo zypper --non-interactive install pssh    ##if SLES

case $(hostnamectl | grep "Operating System" | awk '{print $2}') in
"CentOS")
	sudo yum install pssh -y
;;
"SUSE")
	sudo zypper --non-interactive install pssh
;;
esac

echo "beginning date: $(date)"

if command -v pbsnodes --version &> /dev/null
then
    pbsnodes -avS | grep free | awk -F ' ' '{print $1}' > hosts.txt
fi

pssh -p 290 -t 0 -i -h hosts.txt 'echo "system: $(hostname) ib_name: $(ibstat -l)"' > ib_naming_test_pssh.log 2>&1
sleep 10

grep mlx5_0 ib_naming_test_pssh.log > ib_naming_failed_vms.log
grep mlx5_ib0 ib_naming_test_pssh.log > ib_naming_passed_vms.log



