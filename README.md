# IB-device-name-check
Quick test for checking the names of IB devices on a cluster


The test relies on pssh to check the names of IB devices on Azure HPC clusters. 

To run
```
./ib_naming_test.sh
```

The script generates 3 log files
ib_naming_test_pssh.log containg the full log of the test
ib_naming_failed_vms.log containing the list of VMs for which the test failed
ib_naming_passed_vms.log containing the list of VMs for which the test was successful.

The script currently relies on PBS to obtain the list of VMs. Support for slurm will be added in future. 
