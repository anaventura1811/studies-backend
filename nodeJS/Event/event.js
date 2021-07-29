const { EventEmitter } = require('events');
// console.log(EventEmitter);

const ev = new EventEmitter() // classe na estrutura de função
console.log(ev);

ev.on('saySomething', () => {
  console.log('Ouvindo o evento')
}); // event listener

ev.emit('saySomething'); // emitir eventos com emit
ev.emit('saySomething');