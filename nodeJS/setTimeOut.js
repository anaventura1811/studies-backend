// revisando setTimeOut e funções assíncronas
const timeOut = 3000;
const finished = () => console.log('done!');
console.log('fora do timeOut')

const timer = setTimeout(finished, timeOut)
clearTimeout(timer);
