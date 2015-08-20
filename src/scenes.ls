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
        @say ss, "Let me show you a picture from my vacation."
        @img \fossil
        @say ss, "Now let's demonstrate a choice. What is your favorite color?"
        @choose \red, "Red", ~>
          @say ss, "A fine color."
          game.color = \red
        @choose \blue, "Blue", ~>
          @say ss, "Seriously?"
          game.color = \blue
        @choose \bunny, "Bunny", ~>
          @say ss, "That's not even a color! What are you doing?"
          game.color = \bunny
  * title: "The End"
    condition: -> it.color
    script: ->
      @say ss, "Well, it was brief but we're at the end of the demo for now."
      @say ss, "I was a little surprised your favorite color was #{it.color}."
      @say ss, "Take a look at src/scenes.ls if you'd like to see what's up."


