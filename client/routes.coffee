Router.configure
  layoutTemplate: 'layout'
  notFoundTemplate: 'not-found'
Router.map ->
  @route 'home',
    template: 'stacks'
    path: '/',
    waitOn:->
      @subscribe 'stacks'
    data: stacks: ->
      Stacks.find()
    	
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
    path: 'practice/:_id',
    template: 'practice'
    waitOn: ->
      @subscribe 'cards', @params._id
      Session.set 'slug', @params._id
    data: cards: ->
      Cards.find()
      
  return