

node-geekdaq is a random time-serie generator.

You can use it for scenarios where you just want to test
visualization / processing tools or real-time data, 
and when you do not need to train a real ML algorithm.

See the /samples and /docs directory to see what generated data looks like.

### Usage

    $ npm install geekdaq

```JavaScript
var geekdaq = require("geekdaq");
var generator = geekdaq.generator({ range: 5, levels: 100 });
console.log(generator());
console.log(generator());
``