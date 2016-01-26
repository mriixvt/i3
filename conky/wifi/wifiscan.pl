#!/usr/bin/perl
use strict;

die "[-]Veuillez entrer une interface en argument\012" unless (@ARGV == 1);

my $iface = shift;

my @apz = split(/(.*\n.*\n.*\n.*\n)/, do{local($/); qx{iwlist $iface scanning |grep -E 'Address:|ESSID:|Quality|Encryption key:'|cut -c21-55}});

map {$_ =~ s{(.*)\n(.*)\n(.*)\n(.*)\n} {$4 $1 $2 $3}} @apz;

foreach my $network (@apz)
{
    print $network, "\n";
}
