class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @playerHitAndCheck()
    'click .stand-button': -> @stand()

  playerHitAndCheck: ->
    @model.get('playerHand').hit()
    if Math.min.apply(null, @model.get('playerHand').scores() ) > 21
      console.log 'over 21!'
      @compare()
      #makeNewGame()
      # 1) Notify user
      # 2) Modify interal state of game
      # 3) Give user option to reset
      # 4) Reset game ?

  dealerHitAndCheck: ->
    while Math.min.apply( null, @model.get('dealerHand').scores() ) < 17
      @model.get('dealerHand').hit()
    @compare()


  stand: ->
   @dealerHitAndCheck()

  compare: ->
    playerScore = Math.min.apply(null, @model.get('playerHand').scores() )
    playerScore = if playerScore > 21 then Number.POSITIVE_INFINITY else 21 - playerScore
    console.log playerScore

    dealerScore = Math.min.apply(null, @model.get('dealerHand').scores() )
    dealerScore = if dealerScore > 21 then Number.POSITIVE_INFINITY else 21 - dealerScore
    playerWins = if playerScore < dealerScore then true else false
    console.log(playerWins)


  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

