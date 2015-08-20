ss = \schopen

export scenes =
  * title: "The First Scene"
    condition: -> !!(it.just-started)
    script: ->
        @say ss, "Welcome to the demo for Boundless. Tap to continue."
        it.just-started = false

  * title: "Moving on"
    condition: -> !(it.just-started)
    script: (game) ->
        @say ss, "You may not have noticed, but we just entered the second scene."
        @say ss, "Let's demonstrate a choice. What is your favorite color?"
        @choose \red, "Red", ~>
          @say ss, "A fine color."
          game.color = \red
        @choose \blue, "Blue", ~>
          @say ss, "Seriously?"
          game.color = \blue
        @choose \bunny, "Bunny", ~>
          @say ss, "That's not even a color! What are you doing?"
          game.color = \bunny


