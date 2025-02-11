const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.send("¡Hola, Jenkins! Este es un proyecto Node.js con integración CI/CD");
});

app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
