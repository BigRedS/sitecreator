#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Template;	#libtemplate-perl

my $user = shift;
my $d_templates = $ENV{'TEMPLATES_DIR'};
my $f_sshdConfig = $ENV{'SSHD_CONFIG_FILE'};

my $tt = Template->new({
	INCLUDE_PATH => $d_templates,
	INTERPOLATE  => 1,
}) || die "Error creating Template Toolkit object: $Template::ERROR\n";

my $vars = {
	user => $user
};

my $output = undef;

$tt->process('create_ssh_chroot', $vars, \$output) or die "Error procesing template: $Template::ERROR\n";

print "\n$output\n";

sub createServerAliasDirectives{
	my @domains = @_;
	my $directives;
	foreach(@_){
		$directives.= "ServerAlias $_ www.$_\n\t";
	}
	return $directives;
}
