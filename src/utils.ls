# assorted short functions
random = require(\seedrandom)(\test)

export R = -> ~~(it * random!)
export pick = -> it[R it.length]
export capitalize = -> it[0].to-upper-case! + it.substr 1

# remove an item from an array
export remove = (arr, item) ->
    arr2 = arr.slice 0 # copy
    arr2.splice arr2.index-of(item), 1
    return arr2

export contains = (arr, item) -> return -1 < arr.index-of item

# fisher yates shuffle
export shuffle = ->
    arr = it.slice 0 # copy the array
    for ii from 0 to arr.length - 2
        jj = ii + R(arr.length - ii)
        tmp = arr[ii]
        arr[ii] = arr[jj]
        arr[jj] = tmp
    return arr

export middle = (a, b, c) ->
  if a >= b
    if b >= c then return b
    if a >= c then return c
    return a

  if a >= c then return a
  if b >= c then return c
  return b

export scroll-bottom = ->
  window.scroll-to 0, 1000000
  #set-timeout (-> window.scroll-to 0, 1000000), 10
