
#if gameOver
  #detach AppView
  #call start a newGame function

window.makeNewGame = ->
  $('body').html('')
  appModel = new App(); #initialize all game data
  new AppView(model: appModel).$el.appendTo 'body' # give game data to App View and append to DOM

makeNewGame()
