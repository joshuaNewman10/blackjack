
#if gameOver
  #detach AppView
  #call start a newGame function

window.makeNewGame = ->
  $('body').html('')
  new AppView(model: new App()).$el.appendTo 'body' #start a new game

makeNewGame()
