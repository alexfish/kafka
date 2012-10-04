#KafkaKafka is a tiny gem which allows you to convert standard svn repositories to git. Kaka expects your svn repository to use the standard svn layout:	- tags		- 1.0		- 1.1.0		- 2.0	- branches		- feature 1		- feature 2	- trunk	##InstallationInstalling Kafka is easy thanks to ruby gems:	gem install kafka	
##Usage
Once installed you can start Kafka from your command line interface. The following commands and options are available:
		Commands
	     metamorph: metamorph a svn repository into a git repository
	
	Options
	    -s, --source SOURCE              the source svn repository url
	    -u, --username USERNAME          the username to access the repository
	    -d, --destination DESTINATION    the destination for the new git repository
	    -h, --help                       help
	    
The username and destination options are optional, if on destination is specified the new git repo will be written to `~/kafka`. Here is an example usage with username, source and destination set:

	$ kafka metamorph -s http://mysourcecontrol.com/svn/myrepo -u myusername -d ~/Desktop/myrepo
	
##License		Copyright (C) 2012 by Alex Fish		Permission is hereby granted, free of charge, to any person obtaining a copy	of this software and associated documentation files (the "Software"), to deal	in the Software without restriction, including without limitation the rights	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell	copies of the Software, and to permit persons to whom the Software is	furnished to do so, subject to the following conditions:	The above copyright notice and this permission notice shall be included in	all copies or substantial portions of the Software.	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN	THE SOFTWARE.	Alex Fish - alexefish.com