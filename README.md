node-geekdaq
============

 ![sample](https://raw.github.com/daizoru/node-geekdaq/master/docs/stock2.jpg)
 ![sample2](https://raw.github.com/daizoru/node-geekdaq/master/docs/stock1.jpg)
node-geekdaq is a pure random time-serie generator.

You can use it for scenarios where you just want to test
visualization or processing tools on real-time data, 
and you don't need to train a real ML algorithm.

See the /samples and /docs directory to see what generated data looks like.

### Usage

    $ npm install geekdaq

```JavaScript
var geekdaq = require("geekdaq");
var generator = geekdaq.generator({ range: 5, levels: 100 });
console.log(generator());
console.log(generator());
```

