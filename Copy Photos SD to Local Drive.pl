#!/usr/bin/perl

use strict;
use warnings;
use File::Copy;
$|=1;

my $source_dir = "D:/ "   #Enter SD source destination folder path
my $target_dir = "C:/ "   #Enter target destination folder path
my @files = glob($source_dir/*.arw); #Array created to list each RAW file on the SD card

main();

sub main{

	do copyConfirm;
	
	if ($flag = 1) {
	
		copyPhotos();
	}
	else {
		print "Copying photos from source folder to targer folder not initiated. \n";
	
	}

}

#Subroutine to copy photos from SD card to local drive or backup drive.
sub copyPhotos {

	for my $file (@files) {														#Defining each file from the Array created above on Line 10
		copy ($file, $target_dir) or die "Copy Failed: $!";						#Each file in the SD card will be copied from the Source destination to Target destination

	}
	
}


#Confirmation with the user to copy photos from SD card to local drive or backup drive.
sub copyConfirm {

	while (1) {
	
		my ($yes_no, $flag);
		my $flag = 0;
		
		print "You are about copy your photos from your SD card to your computer. \n ";
		print "Source Directory: $source_dir \n";
		print "Target Directory: $target_dir \n";
		print "Would you like to proceed? (y/n)? If not, enter any other key to exit.\n";
		$yes_no=<STDIN>;  														#Waiting for user input
		chomp($yes_no);
	
		if ($yes_no eq 'y') || ($yes_no eq 'Y') {
			$flag = 1;
			
		}
		
		elsif ($yes_no eq 'n') || ($yes_no eq 'N') {
			$flag = 0;
		}
		
		else {
			$flag = 2;
		}
		
		return $flag;
	
	}
}
	
	














