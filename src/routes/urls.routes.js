import {Router} from 'express';
import { authRoutesValidation } from "../middlewares/auth.middleware.js";
import { urlSchemaValidation } from "../middlewares/urls.middlewares.js";
import { addUrl, getUrlById, getUrl, removeUrl, getRanking} from "../controllers/urls.controllers.js";

const router = Router();

router.post("/urls/shorten", urlSchemaValidation, authRoutesValidation, addUrl);
router.get("/urls/:id", getUrlById);
router.get("/urls/open/:shortenUrl", getUrl);
router.delete("/urls/:id", authRoutesValidation, removeUrl);
router.get("/ranking", getRanking);

export default router;
