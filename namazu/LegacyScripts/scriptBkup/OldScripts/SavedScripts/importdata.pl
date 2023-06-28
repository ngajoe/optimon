#!/usr/bin/perl
#
#importdata.pl (filename)
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

##MySQL dabase info
my $dsn = "DBI:mysql:ips-db1";
my $username = "ipsuser0";
my $password = 'heathkit';
my $counter = 0;

##MySQL database login
my %attr = (PrintError=>0,RaiseError=>1);
my $dbh = DBI->connect($dsn,$username,$password,\%attr);

my ($Time, $Value, $sql, $table, $stmt, $time_fmt, $instance);
$table = "${filename}${subfile}";
$sql = "INSERT INTO ${table}(ts,instance,value)
		VALUES(?,?,?)";

printf("$filename$filedate$subfile prepared.\n");
$stmt = $dbh->prepare($sql);
		
foreach $line(<READIN>){
	chomp $line;
	($Time, $instance, $Value) = split(/,/,$line);
	$time_fmt = strftime("%Y-%m-%d %H:%M:%S", gmtime($Time));
	$stmt->execute($time_fmt,$instance,$Value);	
	
	$counter+=1;
	printf("$filename$filedate$subfile $counter\n");	
}

printf("$filename$filedate$subfile done.\n");
$dbh->disconnect();
close(READIN);
