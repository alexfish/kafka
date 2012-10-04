#KafkaKafka is a tiny gem which allows you to convert standard svn repositories to git. Mostly written as a tiny experiment, it was also born as a solution to the svn2git gem not working correctly with unufddle repositories. 
Kaka expects your svn repository to use the standard svn layout:	- tags		- 1.0		- 1.1.0		- 2.0	- branches		- feature 1		- feature 2	- trunk	##InstallationInstalling Kafka is easy thanks to ruby gems:	gem install kafka	
##Usage
Once installed you can start Kafka from your command line interface. The following commands and options are available:
		Commands
	     metamorph: metamorph a svn repository into a git repository
	
	Options
	    -s, --source SOURCE              the source svn repository url
	    -u, --username USERNAME          the username to access the repository (optional)
	    -d, --destination DESTINATION    the destination for the new git repository (optional)
	    -h, --help                       help
	    
If no destination is specified the new git repo will be written to `~/kafka`. Here is an example usage with username, source and destination set:

	$ kafka metamorph -s http://mysourcecontrol.com/svn/myrepo -u myusername -d ~/Desktop/myrepo
	
The script will output what is happening and when the metamorph is complete, which could take a few hours for very large svn repositories! 

##What now?
Once the metamorph is complete you will have a new git repository with tags and branches in tact. You can now simply add this repository to your existing version control system with the following commands:

Move into the new repo

	$ cd /path/to/my/repo
	
Point the repository to the git server

	$ git remote add origin your-repo-url
	
Add all the files and create the commit
	
	$ git add -A
	$ git commit -m 'Now available in git!'
Make sure we also push the tags
	
	$ git push && git push --tags
	
Done!

##Help!

If the process fails, please open an issue and i'll look into your problem. As this is a very early release it's likely to break. ##License		Copyright (C) 2012 by Alex Fish		Permission is hereby granted, free of charge, to any person obtaining a copy	of this software and associated documentation files (the "Software"), to deal	in the Software without restriction, including without limitation the rights	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell	copies of the Software, and to permit persons to whom the Software is	furnished to do so, subject to the following conditions:	The above copyright notice and this permission notice shall be included in	all copies or substantial portions of the Software.	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN	THE SOFTWARE.	Alex Fish - alexefish.com