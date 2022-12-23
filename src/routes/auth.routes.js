import {Router} from 'express';
import { userSchemaValidation, signInBodyValidation, authRoutesValidation } from "../middlewares/auth.middleware.js";
import { signUp, signIn, getData } from "../controllers/auth.controllers.js";

const router = Router();

router.post("/signup", userSchemaValidation, signUp);
router.post("/signin", signInBodyValidation, signIn);
router.get("/users/me", authRoutesValidation, getData)

export default router;
