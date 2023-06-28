#./full_day_port.sh [date-yesterday if no argument]

DEFAULT_DTG=$(date +%y%m%d -d "1 day ago")
DTG="${1:-$DEFAULT_DTG}"

#Performs mass data formatting for date
echo "Running chic..."
echo "chic_$DTG"
#./importdata2.pl "chic_${DTG}_Q" 8399916
./importdata2.pl "chic_${DTG}_Q" 8399917
./importdata2.pl "chic_${DTG}_Q" 8399918
./importdata2.pl "chic_${DTG}_Q" 8399919
./importdata2.pl "chic_${DTG}_Q" 8399920
echo "Running mad1_$DTG..."
./importdata2.pl "mad1_${DTG}_Q" 12582986
./importdata2.pl "mad1_${DTG}_Q" 12582987
./importdata2.pl "mad1_${DTG}_Q" 12582988
./importdata2.pl "mad1_${DTG}_Q" 12582989
./importdata2.pl "mad1_${DTG}_Q" 12582990
echo "Running mad2_$DTG..."
./importdata2.pl "mad2_${DTG}_Q" 12582985
./importdata2.pl "mad2_${DTG}_Q" 12582986
./importdata2.pl "mad2_${DTG}_Q" 12582987
./importdata2.pl "mad2_${DTG}_Q" 12582988
./importdata2.pl "mad2_${DTG}_Q" 12582989
echo "Running milw_$DTG..."
./importdata2.pl "milw_${DTG}_Q" 12584941
./importdata2.pl "milw_${DTG}_Q" 12584942
./importdata2.pl "milw_${DTG}_Q" 12584943
./importdata2.pl "milw_${DTG}_Q" 12584944
./importdata2.pl "milw_${DTG}_Q" 12584945
echo "Running stpl_$DTG..."
./importdata2.pl "stpl_${DTG}_Q" 12585048
./importdata2.pl "stpl_${DTG}_Q" 12585049
./importdata2.pl "stpl_${DTG}_Q" 12585050
./importdata2.pl "stpl_${DTG}_Q" 12585051
./importdata2.pl "stpl_${DTG}_Q" 12585052
echo "$DTG debundle done."
