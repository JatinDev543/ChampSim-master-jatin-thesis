p=82
while [ $p -lt 108 ]
do
  if ping -c 1 -W 1 "172.27.19.${p}";
  then
     ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  source ~/.bashrc &
     ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  top | grep 'bomodal'  &
  fi
p=$((p+1))
done