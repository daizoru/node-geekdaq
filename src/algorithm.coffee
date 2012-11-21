deck = require 'deck'

module.exports = (options={}) ->
  width = options.range ? 1 # can also be 1
  nbLevels = options.levels ? 100
  range = [ -width .. width ]
  kernel = (level) -> Math.round Math.random() * level
  levels = for level in [ 1 .. nbLevels ]
    cycles: level
    i: level
    values: for i in range
      kernel level
  ->
    for level in levels
      level.cycles--
      if level.cycles <= 0
        level.cycles = level.i
        level.values = for i in range
          kernel level.i
    distribution = {}
    j = -1
    for i in range
      distribution[i] = 0
      j++
      for level in levels
        distribution[i] += level.values[j] # here j must be between 0 and length
    (Number) deck.pick distribution