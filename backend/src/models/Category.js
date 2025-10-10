import mongoose from "mongoose";

const categorySchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
        trim: true,
        unique: true
    },
    color: {
        type: String,
        default: "#FF9800",
        validate: {
            validator: function(v) {
                return /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.test(v);
            },
            message: props => `${props.value} is not a valid color code!`
        }
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

const Category = mongoose.model("Category", categorySchema);

export default Category;