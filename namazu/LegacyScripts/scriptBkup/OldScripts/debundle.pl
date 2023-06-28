#!/usr/bin/perl
#
#debundle.pl (filename)
use warnings;
use strict;

#Read in argument-expect no extension
my $filename = $ARGV[0];

#split_file_delta($filename,"otuKiPmRealNumberOfCorrectedZeros", "_C0");
#split_file_delta($filename,"otuKiPmRealNumberOfCorrectedOnes", "_C1");
split_file_delta($filename,"otuKiPmRealCorrectedBits", "_Cb");
split_file($filename,"otuKiPmRealQValue", "_Q");

printf("done");

#split_file searches the file for matching entries and outputs to csv
sub split_file {
	my ($infile, $oidscan, $outfile) =@_;
		
	open(READIN,"nmslab/$infile.data") || die $!;
	open(WRITEOUT, '>>', "debundle/$infile$outfile.csv") || die $!;
	
	while(<READIN>){
		#entries expected in timestamp(9), IP, OID, and value format
		my ($Time, $Node, $fullOid, $Value) = split;
		#separates OID group and instance number
		my ($Oid, $instance) = split(/\./, $fullOid);
		$Time = substr $Time, 0, 17;
		#only write to file matching OIDs
		if($Oid =~ /$oidscan/){
			printf(WRITEOUT"%s,%s,%s\n", $Time, $instance, $Value);
		}
	}
	close(READIN);
	close(WRITEOUT);
	printf("$outfile done\n");
	return 1;
}

#similar to above, but finds delta between current and last value, and records that
#needs work for overflow instances (happens more than you would like)
sub split_file_delta {
	my ($infile, $oidscan, $outfile) =@_;
	
	open(READIN,"nmslab/$infile.data") || die $!;
	open(WRITEOUT, '>>', "debundle/$infile$outfile.csv") || die $!;

	my @inst_array = ();
	my @last_value = ();
	my $inst_index;
	my $delta;
	while(<READIN>){
		my ($Time, $Node, $fullOid, $Value) = split;
		my ($Oid, $instance) = split(/\./, $fullOid);
		if($Oid =~ /$oidscan/){
			
			# build array of instance #'s and first values
			$inst_index = -1;
			for(my $x=0; $x < @inst_array; $x ++){
				if ($inst_array[$x] == $instance) {
					$inst_index = $x;
				}
			}
			# If we have previous values for an instance, calulate delta and write
			if ($inst_index > -1){
				$delta = $Value - $last_value[$inst_index];
				
				#overflow behavior-saturate value
				$last_value[$inst_index] = $Value;
				if($delta>4294444444){
					$delta = 4294444444; # saturate value
				}
				$Time = substr $Time, 0, 17;
				#if counter cycled, ignore count (for now)
				if($delta>0){
				     printf(WRITEOUT"%s,%s,%s\n", $Time, $instance, $delta);
				}
			
			} else {
				push (@inst_array, $instance);
				push (@last_value, $Value);
			}
		}
	}
	close(READIN);
	close(WRITEOUT);
	printf("$outfile done\n");
	return 1;
}

