const timeOut = 1000;
const checking = () => console.log('checking');
const interval = setInterval(checking, timeOut);
clearInterval(interval);