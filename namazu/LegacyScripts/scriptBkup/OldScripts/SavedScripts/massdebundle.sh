# ./massdebundle.pl [yymmdd]
# 

echo "Running chic..."
./debundle.pl chic_$1
echo "Running mad1..."
./debundle.pl mad1_$1
echo "Running mad2..."
./debundle.pl mad2_$1
echo "Running milw..."
./debundle.pl milw_$1
