import Category from '../models/Category.js'

export async function getAllCategory(req,res){
    try {
        const category = await Category.find().sort({createdAt:-1});
        res.status(200).json(category);
    } catch (error) {
        console.error("Error in fetching all Categories: ", error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function getCategoryById(req,res){
    try {
        const category = await Category.findById(req.params.id);
        if(!category) return res.status(404).json({"message":"Category not found"})
        res.status(200).json(category)
    } catch (error) {
        console.error("Error in fetching Category: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function addCategory(req,res){
    try {
        const {title,color} = req.body;
        const newCategory = new Category({title,color});

        const savedCategory = await newCategory.save();
        res.status(201).json(savedCategory);
    } catch (error) {
        console.error("Error in creating Category: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function updateCategory(req,res){
    try {
        const {title,color} = req.body;
        const updatedCategory = await Category.findByIdAndUpdate(req.params.id,{title,color},{new:true});
        if(!updatedCategory)  return res.status(404).json({ "message": "Category not found" })
        res.status(200).json(updatedCategory);
    } catch (error) {
        console.error("Error in updating Category: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}

export async function deleteCategory(req,res){
    try {
        const deletedCategory = await Category.findByIdAndDelete(req.params.id,{new:true});
        if(!deletedCategory) return res.status(404).json({"message":"category not found"});
        res.status(200).json({"category deleted": deletedCategory})
    } catch (error) {
        console.error("Error in deleting category: ",error);
        res.status(500).json({
            "message":"Internal server error"
        })
    }
}