const { EventEmitter } = require('events');
// console.log(EventEmitter);

const ev = new EventEmitter() // classe na estrutura de função
console.log(ev);

ev.on('saySomething', () => {
  console.log('Ouvindo o evento')
}); // event listener - ouvir sempre 

ev.once('saySomething', () => console.log('Ouvindo uma vez só')); // ouvir uma única vez


ev.emit('saySomething'); // emitir eventos com emit
ev.emit('saySomething');