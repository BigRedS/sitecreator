#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Template;	#libtemplate-perl

my $user = shift;
my $d_templates = $ENV{'TEMPLATES_DIR'};
my $serverName = shift;
my @domains = @ARGV;

my $tt = Template->new({
	INCLUDE_PATH => $d_templates,
	OUTPUT_PATH  => $ENV{'VHOST_DIR'}
	INTERPOLATE  => 1,
}) || die "Error creating Template Toolkit object: $Template::ERROR\n";

my $vars = {
	user	      => $user,
	ServerName    => $serverName,
	ServerAliases => createServerAliasDirectives(@domains),
};

$tt->process('create_apache_vhost', $vars, $serverName) or die "Error creating vhost at $f_virtualhost : $!";

sub createServerAliasDirectives{
	my @domains = @_;
	my $directives;
	foreach(@_){
		$directives.= "ServerAlias $_ www.$_\n\t";
	}
	return $directives;
}
