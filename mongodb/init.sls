# Pre-requisites are installed first

include:
	- mongodb.users

# Create the directory
/opt/mongo:
	file.directory
		- user: mongo
		- group: mongo
		- mode: 755
		- makedirs: True
		- recurse
			- user
			- group
			- mode


# Send the downloaded binaries
/opt/mongo/mongodb-linux-x86_64-3.0.3.tar.gz:
	file:
		- managed
		- source salt://mongodb/mongodb-linux-x86_64-3.0.3.tar.gz
		- user: mongo
		- group: mongo
		- mode: 644
	cmd.run:
		- name: "tar -xvf mongodb-linux-x86_64-3.0.3.tar.gz; mv mongodb-linux-x86_64-3.0.3 mongodb;"
		- user: mongo
		- cwd" /opt/mongo/
		- output_loglevel: quiet
		- require
			- file: /opt/mongo/mongodb-linux-x86_64-3.0.3.tar.gz
		- creates
			- /opt/mongo/mongodb

/opt/mongo/mongodb/conf:
	file.direcory:
		- user: mongo
		- group: mongo
		- mode: 755
		- makedirs: True
		- recurse:
			- user
			- group
			- mode

/var/log/mongo:
	file.directory:
		- user: mongo
		- group: mongo
		- mode: 755
		- makedirs: True
		- recurse:
			- user
			- group
			- mode			