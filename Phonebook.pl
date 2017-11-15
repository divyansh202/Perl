#!/usr/bin/perl
use strict;
use warnings;
=pod
    File: Phonebook.pl
=cut

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname abs_path $0) . '/phonebook';

use PhoneBook qw(run_main);

run_main();
