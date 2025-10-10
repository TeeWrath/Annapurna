import express from "express";
import { getAllCategory,getCategoryById,addCategory,updateCategory,deleteCategory } from "../controllers/categoryController.js";

const router = express.Router();

router.get("/", getAllCategory)
router.get("/:id", getCategoryById)
router.post("/", addCategory)
router.put("/:id", updateCategory)
router.delete("/:id", deleteCategory)

export default router;