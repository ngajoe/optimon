#./full_daily_port.sh [date-yesterday if no argument]

DEFAULT_DTG=$(date +%y%m%d -d "1 day ago")
DTG="${1:-$DEFAULT_DTG}"

#Grabs data from the lab computer
rsync -av wej@nms-lab.boreas.net:~/joec/longhaul/ ~/DataFiles/nmslab/

#Performs mass data formatting for date
echo "Running chic..."
echo "chic_$DTG"
./debundle.pl "chic_$DTG"
echo "Running mad1..."
./debundle.pl "mad1_$DTG"
echo "Running mad2..."
./debundle.pl "mad2_$DTG"
echo "Running milw..."
./debundle.pl "milw_$DTG"
echo "Running stpl..."
./debundle.pl "stpl_$DTG"
#Performs upload to mySQL server
./massimport.pl $DTG

#Notify complete
echo "completed."

#curl -X POST https://textbelt.com/text \
#   --data-urlencode phone='7064298098' \
#   --data-urlencode message='port complete' \
#   -d key=textbelt
