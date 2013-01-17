#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Template;	#libtemplate-perl

my $user = shift;
my $d_templates = $ENV{'TEMPLATES_DIR'};
my $d_virtualhost = $ENV{'VHOST_DIR'};
my $serverName = shift;
my @domains = @ARGV;
my $f_virtualhost = "$d_virtualhost/$serverName";

my $tt = Template->new({
	INCLUDE_PATH => $d_templates,
	INTERPOLATE  => 1,
}) || die "Error creating Template Toolkit object: $Template::ERROR\n";

my $vars = {
	user	      => $user,
	ServerName    => $serverName,
	ServerAliases => createServerAliasDirectives(@domains),
};

$tt->process('create_apache_vhost', $vars, $f_virtualhost) or die "Error creating vhost at $f_virtualhost : $!";

sub createServerAliasDirectives{
	my @domains = @_;
	my $directives;
	foreach(@_){
		$directives.= "ServerAlias $_ www.$_\n\t";
	}
	return $directives;
}
