import mongoose from "mongoose";

const mealSchema = new mongoose.Schema({
    title: {
        type: String,
        required:true,
    },

},{timestamps:true})

const Meal = mongoose.model("Meal",mealSchema)
export default Meal