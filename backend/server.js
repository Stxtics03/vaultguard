const express = require("express")
const bodyParser = require("body-parser")


const app = express()
app.use(bodyParser.json())


app.get("/", (req, res) => {
res.send("VaultGuard backend running ✔️")
})


// Dummy privacy scan endpoint
app.post("/api/scan", (req, res) => {
const { email } = req.body
return res.json({ breached: false, email, matches: [] })
})


app.listen(3000, () => console.log("Backend running on port 3000"))