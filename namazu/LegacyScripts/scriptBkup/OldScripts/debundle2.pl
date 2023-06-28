#!/usr/bin/perl
#
#debundle2.pl (filename, instance)
#Second stage debundling - separate instances
use warnings;
use strict;

#Read in argument-expect no extension
my $filename = $ARGV[0];


split_file($filename,$instance);

printf("done");

#split_file searches the file for matching entries and outputs to csv
sub split_file {
	my ($infile, $oidscan, $instscan, $outfile) =@_;
	
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
