sitecreator
===========

Sitecreator is a flexible means of automating the process of creating accounts on 
shared-style servers. It has a directory of scripts that it uses to do the various
jobs (create unix users, vhosts, modify MySQL permissions), and having generated 
the necessary passwords simply calls these scripts in turn according to its 
configuration, and then prints out those username and password pairs.


It has a mechanism for including in its output what the scripts are doing; for example
the file at `etc/config/example.yaml` prints the name of the database created by
the MySQL script, having been told what form that will take.


In its simplest use, sitecreator is called with just a domain name as an argument
and, having done its work prints out the details. This is the printed result of 
using the configuration file at `etc/config/default.yaml`, having set up all the 
user accounts:



     avi@amazing:~$ sitecreator aviswebsite.co.uk 
     FTP/SSH:
       Username:              aviswebsite
       Password:              E@Vi}FPxL
     
     MySQL:
       Username:              aviswebsite
       Password:              cAnt:'r'*?<F
       Database:              aviswebsite
       Hostname:              localhost
     
     MySQL Dev user:
       Username:              aviswebsite_dev
       Password:              HBA4zAn@IZ9l
       Database:              aviswebsite_dev
       Hostname:              localhost
     
     Mail administration:
       Username:              aviswebsite.co.uk
       Password:              jkd9>j]>Mhczf}
       Mail admin URL:        https://aviswebsite.co.uk/mailadmin
       Primary MX record:     mx1.aviswebsite.co.uk
       Secondary MX record:   mx2.aviswebsite.co.uk
     
     avi@amazing:~$ 


