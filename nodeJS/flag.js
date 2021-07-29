function getFlag(paramStr) {
	const flagIndex = process.argv.indexOf(paramStr) + 1;
	return process.argv[flagIndex];
}
module.exports = getFlag;
