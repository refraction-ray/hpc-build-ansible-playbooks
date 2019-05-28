SENSORS=/usr/bin/sensors
GMETRIC=/usr/bin/gmetric

let count=0
sum=0.0
for temp in $($SENSORS | grep "^Core" | grep -e '+.*C' | cut -f 2 -d '+' | cut -f 1 -d ' ' | sed 's/°C//'); do
    sum=$(echo $sum+$temp | bc)
    # echo $temp, $sum
    let count+=1
done
temp=$(echo "$sum/$count" | bc)

$GMETRIC -t float -n "cpu_temp" -u "Celcius" -v $temp

