Template.addStack.rendered = ->
  Meteor.typeahead.inject()
  return

Template.addStack.helpers 
	languages: ->
		Languages.find().fetch().map (lang) ->
			lang.name

Template.addStack.events
	'click .addStack': (event, template) ->
		event.preventDefault

		title = template.find('.title').value
		fromLang = template.find('.fromLang').value
		toLang = template.find('.toLang').value
		comment = template.find('.comment').value
		username = Meteor.user().username

		# slug = slugify(username + ' ' + ' ' + toLang + ' ' + title + ' ')

		Meteor.call 'createStack', title, fromLang, toLang, comment, username, (error) ->
		Meteor.call 'createLanguage', fromLang, (error) ->
		Meteor.call 'createLanguage', toLang, (error) ->

		Router.go('/')