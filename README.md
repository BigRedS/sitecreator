sitecreator
===========

This README is more a to-do list than an honest description currently. 

Sitecreator is intended to be a flexible means of automating the process of creating
accounts on shared-style servers.

It is, in its simplest use, run with a domain-name as its only argument:

   sitecreator mywebsite.com

It reads a YAML file to find out what creating such an account entails, and runs each
of a series of configured scripts in turn, which live in templates/. These scripts 
should be very small and single-use, and they are encouraged to use templates when they
need to write config files (the assumption is that the Template Toolkit will be used 
with Perl scripts, but nothing is required).


If more than one yaml file exists in the config/ directory, the user is presented with
a list to choose from, or may simply choose it by name with a command-line option.

The usernames and database names are created by using the lowest-level component of the
domain name passed ('twitter' in 'twitter.com' and 'alpha' in 'alpha.gov.uk'), but this 
can be overriden at run time with switches.

Sitecreator will output as little as possible in the case of success, printing out a 
summary of users created, along with credentials, and log this data somewhere.

Currently etc/config/default.yaml contains all the supported configuration options.
