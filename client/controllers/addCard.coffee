Template.addFlashcard.events
	'click .btn': (event, template) ->
		event.preventDefaultz

		fromText = template.find('.fromText').value
		toText = template.find('.toText').value
		comment = template.find('.comment').value
		stack = Session.get 'slug'

		Meteor.call 'createCard', fromText, toText, comment, stack, (error) ->

		template.find('.addCardForm').reset()
