{inspect} = require 'util'

# we don't do much things right now
exports.generator = require './algorithm'

# create a fake market
exports.createMarket = (options={}) ->
  server         = options.server ? 'geekdaq'
  codes          = options.tickers ? []
  updateInterval = options.updateInterval ? 500
  commissions    = options.commissions ? {buy: 0, sell: 0}

  randInt = (min,max) -> Math.round(min + Math.random() * (max - min))

  tickers = {}
  for code in codes
    tickers[code] =
      func: Geekdaq.generator
        range: 5
        levels: 150
      price: randInt 100, 400
      volume: randInt 100000, 400000

  # update regularly the prices
  repeat updateInterval, ->
    for code, ticker of tickers
      ticker.price += ticker.func()

  symbols: -> symbols
  tickers: -> tickers
  ticker: (code) -> tickers[code]
  commissions: commissions
