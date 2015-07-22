Meteor.startup ->
	Meteor.publish 'stacks', ->
		console.dir 'Fetching stacks'
		console.dir 'Found ' + Stacks.find().count()
		return Stacks.find()

	Meteor.publish 'languages', ->
		console.dir 'Fetching languages'
		console.dir 'Found ' + Languages.find().count()
		return Languages.find()

Meteor.methods
	'createStack': (title, fromLang, toLang, comment, username) ->
    Stacks.insert
    	title: title
    	fromLang: fromLang
    	toLang: toLang
    	comment: comment
    	username: username
    	# slug: slug
    	createdDate: new Date()

  'createLanguage': (name)->
  	console.dir 'createLanguage ' + name

  	if Languages.find(name: name).count() is 0
  		Languages.insert
  			name: name
