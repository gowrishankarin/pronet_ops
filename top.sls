base:
  'roles:pronet'
  	- match: grain

  'roles:mongo*'
	- match: grain
	- mongodb

	'roles:mongo-config'
	  - match: grain
	  - mongodb.config

	'roles:mongo-shard'
	  - match: grain
	  - mongodb.shard

	'roles:mongo-router'
	  - match: grain
	  - mongodb.router
	  - mongodb.mongs-connect-shard
	