Router.configure
  layoutTemplate: 'layout'
  notFoundTemplate: 'not-found'
Router.map ->
  @route 'home',
    path: '/',
    template: 'index'
    	
  @route 'addStack',
    waitOn: ->
      @subscribe 'languages'
    data: languages: ->
      Languages.find()

  @route 'stacks',
  	waitOn:->
  		@subscribe 'stacks'
  	data: stacks: ->
  		Stacks.find()

  @route 'flashcards',
    path: '/flashcards/:slug',
    template: 'flashcards'
    waitOn: ->
      @subscribe 'cards', @params.slug
      Session.set 'slug', @params.slug
    data: cards: ->
      Cards.find()

  @route 'practice',
    path: 'practice/:slug',
    template: 'practice'
    waitOn: ->
      @subscribe 'cards', @params.slug
      Session.set 'slug', @params.slug
    data: cards: ->
      Cards.find()
      
  return