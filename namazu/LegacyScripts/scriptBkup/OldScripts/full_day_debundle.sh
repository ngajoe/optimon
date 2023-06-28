#./full_daily_port.sh [date-yesterday if no argument]

DEFAULT_DTG=$(date +%y%m%d -d "1 day ago")
DTG="${1:-$DEFAULT_DTG}"

#Performs mass data formatting for date
echo "Running chic..."
echo "chic_$DTG"
./debundle.pl "chic_$DTG"
echo "Running mad1_$DTG..."
./debundle.pl "mad1_$DTG"
echo "Running mad2_$DTG..."
./debundle.pl "mad2_$DTG"
echo "Running milw_$DTG..."
./debundle.pl "milw_$DTG"
echo "Running stpl_$DTG..."
./debundle.pl "stpl_$DTG"
echo "$DTG debundle done."
