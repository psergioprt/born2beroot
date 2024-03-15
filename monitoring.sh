#!/bin/bash

# The architecture of the operating system and its kernel version)
arch=$(uname -a)

# The number of physical processors
cpu=$(grep "physical id" /proc/cpuinfo |wc -l)

# The number of virtual processors
vcpu=$(grep "processor" /proc/cpuinfo |wc -l)

# The current available RAM on your server and its utilization rate as a percentage
# Available RAM
free_ram=$(free --mega | awk '$1 == "Mem:" {print $3}')
# Total RAM
total_ram=$(free --mega | awk '$1 == "Mem:" {print $2}')
# RAM utilization as percentage
perc_ram=$(free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

#The current available memory on your server and its utilization as a percentage (Disk u>
#Memory use
free_mem=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_usage += $3} END {print>
#Memory total
total_mem=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_total += $2} END {prin>
#Memory utilization as percentage
perc_mem=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{m_u += $3} {m_t += $2} END {pr>

#The current utilization rate of your processors as a percentage
cpu_f=$(vmstat 1 2 | tail -1 | awk '{print $15}')
sub_cpu=$(expr 100 - $cpu_f)
cpu_l=$(printf "%.1f" $sub_cpu)

#The date  and time of the last reboot
dt_reboot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

#Whether LVM is active or not
lvm=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

#The number of active connections
tcp=$(ss -ta | grep ESTAB | wc -l)

#The number of users using the server
users=$(users | wc -w)

#The IPv4 address of your server and its MAC (Media Acess Control) address.
ip=$(hostname -I) #IP address
mac=$(ip link | grep "link/ether" | awk '{print $2}') #mac address

#The number of commands executed with the sudo program
sudo=$(journalctl _COMM=sudo | grep COMMAND | wc -l)


wall "  #Arquitecture: $arch
        #CPU Physical: $cpu
        #vCPU: $vcpu
        #Memory Usage: $free_ram/${total_ram}MB ($perc_ram%)
        #Disk Usage Memory use: $free_mem/$total_mem ($perc_mem)
        #CPU load: $cpu_l%
        #Last boot: $dt_reboot
        #LVM use: $lvm
        #Connections TCP: $tcp
        #User log: $users
        #Network: $ip ($mac)
        #Sudo: $sudo"

