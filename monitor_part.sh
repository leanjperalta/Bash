#The mail command forwards the parameters to an smtp relay server configured in the local .mailrc file.
#!/bin/bash
threshold=80
df -H | grep -vE '^Filesystem|tmpfs|cdrom|loop' | awk '{ print $5 " " $1 }' | while read output;
do
  usage=$(echo $output | awk '{ print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{ print $2 }')
  if [ $usage -ge $threshold ]; then
    echo "Warning in $(hostname): $partition is at $usage% usage" | mail -s "Partition threshold warning" mail@domain.com
  fi
done
