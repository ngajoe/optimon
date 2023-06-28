#!/usr/bin/perl
#
#massdata.pl (filedate as yymmdd)
use warnings;
use strict;
use DBI;
use POSIX qw ( strftime );

my $mfd = $ARGV[0];
$mfd = "_$mfd";

importdata ("mad1${mfd}_Q");
importdata ("mad2${mfd}_Q");
importdata ("chic${mfd}_Q");
importdata ("milw${mfd}_Q");
#importdata ("stpl${mfd}_Q");

#importdata ("mad1${mfd}_C1");
#importdata ("mad1${mfd}_C0");
#importdata ("milw${mfd}_C1");
#importdata ("milw${mfd}_C0");

importdata ("mad2${mfd}_Cb");
importdata ("chic${mfd}_Cb");
#importdata ("stpl${mfd}_Cb");

sub importdata {
	#Read in argument-expect no extension
	my ($filename,$filedate,$subfile) = split(/_/,$_[0]);
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

	#construct query string
	my ($Time, $Value, $sql, $table, $stmt, $time_fmt, $instance);
	$table = "${filename}${subfile}";
	$sql = "INSERT INTO ${table}(ts,instance,value)
		VALUES(?,?,?)";

	printf("$filename$filedate$subfile prepared.\n");
	$stmt = $dbh->prepare($sql);
		
	foreach $line(<READIN>){
		chomp $line;
		
		($Time, $instance, $Value) = split(/,/,$line);
		#formats time
		$time_fmt = strftime("%Y-%m-%d %H:%M:%S", gmtime($Time));
		#executes query
		$stmt->execute($time_fmt,$instance,$Value);	
	
		#printf counter detects a hanging process
		$counter+=1;
		printf("$filename$filedate$subfile $counter\n");	
	}

	printf("$filename$filedate$subfile done.\n");
	$dbh->disconnect();
	close(READIN);
}
