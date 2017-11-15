package PerlPhoneBook;
use strict;
use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(run_main);

my %phonebook;

#sub run_main {
    while (1) {
        my $choice = menu();
        if($choice == 1){
            addEntry();
        } elsif ($choice == 2){
            deleteEntry();
        } elsif ($choice == 3){
            searchEntry();
        } elsif ($choice == 4) {
            showEntry();
        } elsif ($choice == 5) {
            updateEntry();
		} elsif ($choice == 6) {
            exit();
        } else {
            print "\nInvalid Entry Try Again!";
        }
    }
#}
#########################################################################
sub menu {
    print "\n1. Add an entry.\n";
    print "2. Delete an entry.\n";
    print "3. Look up an entry.\n";
    print "4. List all entry.\n";
	print "5. Update an entry.\n";
    print "6. Quit.\n";
    print "\nEnter your choice(1-6): ";
    my $prompt = <STDIN>;
    return $prompt;
}
#########################################################################
sub addEntry{
    print "\nEnter a name: ";
    chomp(my $name = <STDIN>);
    $name = lc($name);
    if(exists $phonebook{$name}){
        print "Entry already exists!\n";
    } else {
        print "\nEnter phone number: ";
        chomp(my $phone = <STDIN>);
        $phonebook{$name} = $phone;
    }
}
################################################################################
sub searchEntry{
    print "\nEnter name: ";
    chomp(my $searchname = <STDIN>);
    $searchname = lc($searchname);
    if(exists($phonebook{$searchname})){
        print "\nPhone Number : ".($phonebook{$searchname})."\n";
    } else {
        print "\nEntry doesnt exists.\n";
    }
}
############################################################################
sub deleteEntry{
    print "Enter name: ";
    chomp(my $delname = <STDIN>);
    $delname = lc($delname);
    if(exists($phonebook{$delname})){
        delete($phonebook{$delname});
        print "\nThe name and phone have been deleted.\n";
    } else {
        print "\nThere is no such name in phone book.\n";
    }
}
############################################################################
sub showEntry{
	print "\n\t   Name \t Contact\n";
	my $i = 1;
    while((my $key, my $value) = each(%phonebook)){
        print "\n\t$i. $key\t$value\n";
		$i++;
    }
}
sub updateEntry{
    print "\nEnter name of the contact to be updated : ";
    chomp(my $searchname = <STDIN>);
    $searchname = lc($searchname);
    if(exists($phonebook{$searchname})){
		print "\nUpdate Name: ";
		chomp(my $name = <STDIN>);
		$name = lc($name);
		print "\nUpdate phone number: ";
		chomp(my $phone = <STDIN>);
		$phonebook{$name} = $phone;
		delete($phonebook{$searchname});
		print "\nEntry updated successfully\n";
		}
        
     else {
        print "\nEntry doesnt exists.\n";
    }
}
