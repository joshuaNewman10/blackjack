class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @hitAndCheck()
    'click .stand-button': -> @stand()

  playerHitAndCheck: ->
    @model.get('playerHand').hit()
    if Math.max( @model.get('playerHand').scores()[0] ) > 21
      console.log 'over 21!'
      makeNewGame()
      # 1) Notify user
      # 2) Modify interal state of game
      # 3) Give user option to reset
      # 4) Reset game ?

  dealerHitAndCheck: ->

  stand: ->
   @dealerHitAndCheck()

  compare: ->


  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

