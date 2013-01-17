sitecreator
===========

This README is more a to-do list than an honest description currently. 

Sitecreator is intended to be a flexible means of automating the process of creating
accounts on shared-style servers. It has know necessary knowledge of what sort of 
accounts it's going to set up, just a list of passwords (and, optionally) usernames
to generate, and a list of scripts to pass these to as arguments.

It is in its simplest use run with a domain-name as its only argument:

    sitecreator mywebsite.com

It deduces a username (everything in the domain name up to the first dot) and then reads
a YAML file to find out which usernames and passwords to generate, and then runs the 
scripts defined in that file to create those usernames and any other bits and pieces 
(Apache config, SSH keys etc.)


If more than one yaml file exists in the config/ directory, the user is presented with
a list to choose from, or may simply choose it by name with a command-line option. 


Currently, default.yaml (at etc/config/default.yaml) is actually a specification 
masquerading as a config file.
