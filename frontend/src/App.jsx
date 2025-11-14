import React, { useState } from "react"
import { connectWallet } from "./wallet.js"


export default function App() {
const [account, setAccount] = useState(null)


async function handleConnect() {
try {
const acc = await connectWallet()
setAccount(acc)
} catch (err) {
alert(err.message)
}
}


return (
<div style={{ padding: 20, fontFamily: "system-ui" }}>
<h1>VaultGuard — MVP</h1>
<button onClick={handleConnect}>Connect Wallet</button>
<p style={{ marginTop: 20 }}>Account: {account || "Not connected"}</p>
</div>
)
}