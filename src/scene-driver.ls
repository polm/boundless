# functions for running scenes
# Note this doesn't include functions needed inside scenes,
# this only handles the selection process

{R, remove, contains, shuffle} = require \./utils

fail = ->
  throw name: "Scene Condition Failure", message: "Failed #{it} check"

scene-is-valid = (scene, game) ->
  # assume scenes are only used once
  if scene.used then return false
  # scene.condition may be empty (always ok) or a function
  if not scene.condition then return true
  return scene.condition game

export class SceneDriver
  (@log) ~>
    @scenes = []

  add-scenes: ~>
    for scene in it
      for hook in <[ say choose img delay ]>
        scene[hook] = @log[hook]
      @scenes.push scene

  play-scene: (game) ~>
    for scene in shuffle @scenes
      if scene-is-valid scene, game
        scene.script game
        scene.used = true
        @log.start ~> @play-scene game
        return true
    console.error "no valid scene found!"
    return false
