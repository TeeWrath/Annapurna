import Meal from '../models/Meal.js'

export async function getAllMeals(req,res){
    try {
        const meals = await Meal.find().sort({createdAt:-1});
        res.status(200).json(meals);
    } catch (error) {
        console.error("Error in fetching all meals: ", error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function getMealById(req,res){
    try {
        const meal = await Meal.findById(req.params.id);
        if(!meal) return res.status(404).json({"message":"Meal not found"})
        res.status(200).json(meal)
    } catch (error) {
        console.error("Error in fetching meal: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function addMeal(req,res){
    try {
        const {title,categories,affordability,complexity,imageUrl,duration,ingredients,steps,isGlutenFree,isVegan,isVegetarian,isLactoseFree} = req.body;
        const newMeal = new Meal({title,categories,affordability,complexity,imageUrl,duration,ingredients,steps,isGlutenFree,isVegan,isVegetarian,isLactoseFree});

        const savedMeal = await newMeal.save();
        res.status(201).json(savedMeal);
    } catch (error) {
        console.error("Error in creating meal: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function updateMeal(req,res){
    try {
        const {title,categories,affordability,complexity,imageUrl,duration,ingredients,steps,isGlutenFree,isVegan,isVegetarian,isLactoseFree} = req.body;
        const updatedMeal = await Meal.findByIdAndUpdate(req.params.id,{title,categories,affordability,complexity,imageUrl,duration,ingredients,steps,isGlutenFree,isVegan,isVegetarian,isLactoseFree},{new:true});
        if(!updatedMeal)  return res.status(404).json({ "message": "Meal not found" })
        res.status(200).json(updatedMeal);
    } catch (error) {
        console.error("Error in updating meal: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function deleteMeal(req,res){
    try {
        const deletedMeal = await Meal.findByIdAndDelete(req.params.id,{new:true});
        if(!deletedMeal) return res.status(404).json({"message":"meal not found"});
        res.status(200).json({"meal deleted": deletedMeal})
    } catch (error) {
        console.error("Error in deleting meal: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}