console.log(process.argv)
// lista de argumentos sendo executadas no node

// console.log('meu nome é ', process.argv[2] + ' ' + process.argv[3])
const first_name = process.argv[2];
const last_name = process.argv[3];
console.log(`Seu nome é ${first_name} ${last_name}`)