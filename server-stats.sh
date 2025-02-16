
#!/bin/bash
echo "===== Server Performance Stats is running! =====" #printing a header to indicate the script is running
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 + $4 "%"}' #this displays the CPU usage
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2}' #display the memory uage
df -h --total | grep "total" | awk '{print "Used: " $3 " / Total: " $2 " (" $5 " used)"}' #display the disk usage
ps -eo pid,comm,%cpu --sort=-%cpu | head -6 #show top 5 processes consuming the most CPU
ps -eo pid,comm,%mem --sort=-%mem | head -6 #show the top 5 processes consuming the most memory

