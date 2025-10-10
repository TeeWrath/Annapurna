import express from "express";

const router = express.Router();

router.get("/", (req,res) => {
    console.log("Fetched all categories")
    res.json({message: "All categories fetched successfully"})
})

export default router;