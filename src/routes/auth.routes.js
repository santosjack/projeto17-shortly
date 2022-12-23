import {Router} from 'express';
import { userSchemaValidation, signInBodyValidation } from "../middlewares/auth.middleware.js";
import { signUp, signIn } from "../controllers/auth.controllers.js";

const router = Router();

router.post("/signup", userSchemaValidation, signUp);
router.post("/signin", signInBodyValidation, signIn);

export default router;
