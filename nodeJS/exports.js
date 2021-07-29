// module.exports = "Enviando dados do meu módulo"
function getFlag(paramStr) {
  // const findingString = process.argv.filter((el, index) => (
  //   el[index] === paramStr ? el[index + 1] : ''
  // ))
  // return findingString;
  const flagIndex = process.argv.indexOf(paramStr) + 1
  return process.arg[flagIndex];
}
module.exports = getFlag;

/* 
const getFlags = (flag) => {
  const index = process.argv.indexOf(flag) + 1
  return process.argv[index]

}
*/
