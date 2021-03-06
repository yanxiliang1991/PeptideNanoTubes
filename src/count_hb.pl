#!/usr/bin/perl

# Analyse the hydrogen bonding in a set of PDB files generated by GMIN

@file=`grep Energy lowest`;
if (scalar(@ARGV)!=2){&usage};
foreach $line (@file){
	@words = split(/=|\s+/,$line);
	$i = $words[3];
	$energy = $words[5];
	$hb = `PDBHbond lowest$i.1.pdb $ARGV[0] $ARGV[1]`;
	print "$i $energy $hb";
}

sub usage{
	die "Usage: count_hb.pl <int ringsize> <int num_rings>\n";
}
