{inspect} = require 'util'

generator = require './algorithm'

debug = (msg) -> console.log msg if yes
pretty = (obj) -> "#{inspect obj, no, 20, yes}"
delay = (t, f) -> setTimeout f, t
repeat = (t, f) -> setInterval f, t

randInt = (min,max) -> Math.round(min + Math.random() * (max - min))


symbols = [ 'JS', 'LISP', 'PERL', 'RUBY', 'NET', 'JAVA', 'CAFE' ]
tickers = {}
for symbol in symbols
  tickers[symbol] =
    func: generator 
      range: 5
      levels: 150
    price: randInt 100, 400

console.log Object.keys(tickers).join ','
repeat 5, ->

  values = for name, ticker of tickers
    ticker.price += ticker.func()
    ticker.price
  console.log values.join ','