#!/usr/bin/perl
#
#importdata2.pl (filename instance)
#will load only the instance specified
use warnings;
use strict;
use DBI;
use POSIX qw ( strftime );


#Read in argument-expect no extension
my ($filename,$filedate,$subfile) = split(/_/,$ARGV[0]);
$filedate = "_$filedate";
$subfile = "_$subfile";
open(READIN,"debundle/${filename}${filedate}${subfile}.csv") || die;
my $line;
my $targetinstance = $ARGV[1];

##MySQL dabase info
my $dsn = "DBI:mysql:ips-db1";
my $username = "ipsuser0";
my $password = 'heathkit';
my $counter = 0;

##MySQL database login
my %attr = (PrintError=>0,RaiseError=>1);
my $dbh = DBI->connect($dsn,$username,$password,\%attr);

#create query string
my ($Time, $Value, $sql, $table, $stmt, $time_fmt, $instance);
$table = "${filename}${subfile}_${targetinstance}";
$sql = "INSERT INTO ${table}(ts,value)
		VALUES(?,?)";

printf("$filename$filedate${subfile}_${targetinstance} prepared.\n");
$stmt = $dbh->prepare($sql);
		
foreach $line(<READIN>){
	chomp $line;
	#prepare time format
	($Time, $instance, $Value) = split(/,/,$line);
	$time_fmt = strftime("%Y-%m-%d %H:%M:%S", gmtime($Time));
	if($instance =~ $targetinstance)
	{
		#executes query
		$stmt->execute($time_fmt,$Value);	
		#printf used here to detect any hanging process
		$counter+=1;
		printf("$filename$filedate$subfile $counter\n");
	}	
}

printf("$filename$filedate$subfile done.\n");
$dbh->disconnect();
close(READIN);
