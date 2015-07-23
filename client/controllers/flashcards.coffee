Handlebars.registerHelper 'slug', (input) ->
  Session.get 'slug'

      

# Template.practice.cards = ->
#   cards = document.querySelectorAll('.card.effect_click')

#   clickListener = (card) ->
#     card.addEventListener 'click', ->
#       c = @classList
#       # if c.contains('flipped') == true then c.remove('flipped') else c.add('flipped')
#       # return
#     return

#   i = 0
#   len = cards.length
#   while i < len
#     card = cards[i]
#     clickListener card
#     i++
#   return