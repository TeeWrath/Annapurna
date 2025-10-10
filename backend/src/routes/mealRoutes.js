import express from "express";
import { getAllMeals,getMealById,addMeal,updateMeal,deleteMeal } from "../controllers/mealController.js";

const router = express.Router();

router.get("/", getAllMeals)
router.get("/:id", getMealById)
router.post("/", addMeal)
router.put("/:id", updateMeal)
router.delete("/:id", deleteMeal)

export default router;