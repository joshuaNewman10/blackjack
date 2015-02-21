# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()

    @set 'playerHand', @dealPlayer()
    @set 'dealerHand', @dealDealer()


  dealPlayer: ->
    new Hand [@get('deck').pop(), @get('deck').pop()], @get('deck'), false

  dealDealer: ->
    new Hand [@get('deck').pop().flip(), @get('deck').pop()], @get('deck'), true





