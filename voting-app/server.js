const express = require("express");
const { MongoClient } = require("mongodb");

const app = express();
app.use(express.json());

const uri = process.env.MONGO_URI;
const client = new MongoClient(uri);

let db;

async function connectDB() {
  await client.connect();
  db = client.db("voting_db");
  console.log("Connected to MongoDB");
}

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.post("/vote", async (req, res) => {
  const { option } = req.body;

  if (!option) {
    return res.status(400).json({ error: "option is required" });
  }

  await db.collection("votes").insertOne({ option });
  res.json({ message: "Vote saved", option });
});

app.get("/results", async (req, res) => {
  const a = await db.collection("votes").countDocuments({ option: "A" });
  const b = await db.collection("votes").countDocuments({ option: "B" });

  res.json({ A: a, B: b });
});

connectDB().then(() => {
  app.listen(8000, () => {
    console.log("Server running on port 8000");
  });
});
