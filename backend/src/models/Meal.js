import mongoose from "mongoose";

const complexityEnum = ["simple", "challenging", "hard"];
const affordabilityEnum = ["affordable", "pricey", "luxurious"];

const mealSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
        trim: true
    },
    categories: [{
        type: String,
        required: true
    }],
    affordability: {
        type: String,
        enum: affordabilityEnum,
        required: true
    },
    complexity: {
        type: String,
        enum: complexityEnum,
        required: true
    },
    imageUrl: {
        type: String,
        required: true
    },
    duration: {
        type: Number,
        required: true,
        min: 1
    },
    ingredients: [{
        type: String,
        required: true
    }],
    steps: [{
        type: String,
        required: true
    }],
    isGlutenFree: {
        type: Boolean,
        default: false
    },
    isVegan: {
        type: Boolean,
        default: false
    },
    isVegetarian: {
        type: Boolean,
        default: false
    },
    isLactoseFree: {
        type: Boolean,
        default: false
    }
}, { 
    timestamps: true,
    toJSON: {
        transform: function(doc, ret) {
            ret.id = ret._id.toString();
            delete ret._id;
            delete ret.__v;
            return ret;
        }
    }
});

// Add index for better query performance
// mealSchema.index({ title: 'text'});
// mealSchema.index({ categories: 1 });
// mealSchema.index({ affordability: 1 });
// mealSchema.index({ complexity: 1 });

const Meal = mongoose.model("Meal", mealSchema);

export default Meal;