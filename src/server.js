import express, { application } from "express";
import cors from "cors";
import dotenv from "dotenv";
dotenv.config();

import authRoutes from "./routes/auth.routes.js";
import urlRoutes from "./routes/urls.routes.js";

const app = express();
app.use(cors());
app.use(express.json());

app.use(authRoutes);
app.use(urlRoutes);


const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Server running in port: ${port}`));
