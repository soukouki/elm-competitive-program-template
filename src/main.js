const Elm = require('./Worker.elm')

const worker = Elm.Elm.Worker.init()

worker.ports.responce.subscribe(function(message) {
  console.log(message)
  process.exit();
});

const str = require('fs').readFileSync('/dev/stdin', 'utf8')
worker.ports.start.send(str)
