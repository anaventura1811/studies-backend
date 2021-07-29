const getFlag = require('./flag.js');
console.log(`Oi ${getFlag('--name')}. ${getFlag('--greeting')}`);
