#!/usr/bin/perl
#
#importdata.pl (filename)
use warnings;
use strict;
use DBI;
use POSIX qw ( strftime );

#Read in argument-expect no extension
my $filename = $ARGV[0];
my $subfile = "_Q";
open(READIN,"debundle/${filename}${subfile}.csv") || die;
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
$table = "MAD1_Q";
$sql = "INSERT INTO ${table}(ts,instance,value)
		VALUES(?,?,?)";

printf("Prepared.\n");
$stmt = $dbh->prepare($sql);
		
foreach $line(<READIN>){
	chomp $line;
	($Time, $instance, $Value) = split(/,/,$line);
	$time_fmt = strftime("%Y-%m-%d %H:%M:%S", gmtime($Time));
	$stmt->execute($time_fmt,$instance,$Value);	
	
	$counter+=1;
	printf("$counter\n");	
}

printf("done.\n");
$dbh->disconnect();
close(READIN);
