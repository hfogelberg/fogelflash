Meteor.startup ->
	Meteor.publish 'cards', (stack) ->
		console.dir 'Found ' + Cards.find({stack: stack}).count() + ' cards'
		Cards.find
			stack: stack

Meteor.methods
	'createCard': (fromText, toText, comment, stack) ->
		console.dir toText
		Cards.insert
			fromText: fromText
			toText: toText
			comment: comment
			stack: stack
			createdDate: new	Date()
