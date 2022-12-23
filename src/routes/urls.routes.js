import {Router} from 'express';
import { authRoutesValidation } from "../middlewares/auth.middleware.js";
import { urlSchemaValidation } from "../middlewares/urls.middlewares.js";
import { addUrl, getUrlById, getUrl} from "../controllers/urls.controllers.js";

const router = Router();

router.post("/urls/shorten", urlSchemaValidation, authRoutesValidation, addUrl);
router.get("/urls/:id", getUrlById);
router.get("/urls/open/:shortenUrl", getUrl);
//router.delete("/urls/:id", signInBodyValidation, signIn);
//router.get("/ranking", signInBodyValidation, signIn);

export default router;
