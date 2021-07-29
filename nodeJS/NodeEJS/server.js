const express = require('express');
const app = express();
app.set("view engine", "ejs");

app.get("/", function(req, res) {
  const items = [
		{ title: 'Titulo', message: 'teste' },
		{ title: 'Titulo', message: 'teste' },
		{ title: 'Titulo', message: 'teste' },
		{ title: 'Titulo', message: 'teste' },
		{ title: 'Titulo', message: 'teste' },
	];
  res.render("pages/index", {
    qualidades: items,
  });
});

app.get("/about", function(req, res) {
  res.render("pages/about");
});

app.listen(8080);
console.log("Rodando");
