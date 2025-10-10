import express from "express";

const router = express.Router();

router.get("/", (req,res) => {
    console.log("Fetched all meals")
    res.json({message: "All meals fetched successfully"})
})

export default router;