{SceneDriver} = require \./scene-driver

write-me = -> throw name: "Not Implemented", message: "Write me!"

class Game
  ~>
    @just-started = true
    # put any state here

game = new Game!

{Log} = require \./log
log = new Log document.query-selector \#log
scene-driver = new SceneDriver log
base-scenes = require(\./scenes).scenes
scene-driver.add-scenes base-scenes

# here we go!
scene-driver.play-scene game
