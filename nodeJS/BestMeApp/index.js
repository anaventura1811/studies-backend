const questions = [
  "O que aprendi hoje?",
  "O que me deixou aborrecido(a)? E o que eu poderia fazer para me sentir melhor?",
  "O que me deixou feliz hoje?",
  "Quantas pessoas ajudei hoje?",
];

const ask = (index = 0) => {
  process.stdout.write(questions[index] + "\n\n\n")
}

ask();

// como um event listener
process.stdin.on("data", data => {
  process.stdout.write(data.toString().trim() + '\n')
})