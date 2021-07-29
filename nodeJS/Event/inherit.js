// Herdando EventEmitter
const { inherits } = require('util');
const { EventEmitter } = require('events');

function Character(name) {
  this.name = name;
} // função construtora

inherits(Character, EventEmitter);

const chapolin = new Character('Chapolin');
chapolin.on('help', () => console.log(`Eu! O ${chapolin.name} colorado!!`));
// herança para a função do eventEmitter

console.log('Oh! E agora? Quem poderá me defender?');
chapolin.emit('help');