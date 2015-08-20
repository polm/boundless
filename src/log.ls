# This handles interaction with the dom

{scroll-bottom} = require \./utils
get-div = -> document.create-element \div

export class Log
  (@div) ~>
    @q = []
    @choices = []

  step: ~>
    @cancel-onclicks!
    if @q.length == 0 #finished
      return @callback?!
    (@q.shift!)!
    scroll-bottom!

  start: (callback) ~>
    @callback = callback
    @step!

  cancel-onclicks: ~>
    nodes = @div.query-selector-all \.message
    for node in nodes
      node.onclick = null

  say: (actor, words, extra-class=null) ~>
    @q.push ~>
      message = get-div!
      message.class-name = \message
      message.innerHTML = words
      message.onclick = @step
      if actor
        message.style["background-image"] = "url(avatars/#{actor}.jpg)"
      if extra-class
        message.class-name += " " + extra-class

      @div.append-child message

  img: (img-name) ~>
    @say null, "<img src=\"img/#{img-name}.jpg\"></img>", \img

  #TODO make this skippable
  delay: (wait=1000) ~>
    @q.push ~>
      set-timeout @step, wait

  choose: (label, words, followup) ~>
    ss = @step
    wrapped-followup = ->
      followup label
      @class-name += " chosen"
      ss!
    @choices.push {
      label: label
      words: words
      followup: wrapped-followup
    }
    @q.push ~>
      @q = [] # clear the queue
      for choice in @choices
        cdiv = get-div!
        cdiv.class-name = "message choice"
        cdiv.innerHTML = choice.words
        cdiv.onclick = choice.followup
        @div.append-child cdiv
      @choices = []
