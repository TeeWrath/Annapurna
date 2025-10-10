import express from 'express'
import dotenv from 'dotenv'

import mealRoutes from '../src/routes/mealRoutes.js'
import categoryRoutes from '../src/routes/categoryRoutes.js'
import { connectDB } from './config/db.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5001;

app.use(express.json())
app.use("/api/meals",mealRoutes)
app.use("/api/categories",categoryRoutes)

connectDB().then(()=> {
    app.listen(PORT,() => {
        console.log("server is running on port: ", PORT);
    })
})