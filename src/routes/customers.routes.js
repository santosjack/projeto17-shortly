import { Router } from "express";
import {
  create,
  findAll,
  findById,
  update,
} from "../controllers/customers.controller.js";
import { validSchemaCustomer } from "../middlewares/customers.middlewares.js";
const router = Router();

router.post("/customers", validSchemaCustomer, create);
router.get("/customers", findAll);
router.get("/customers/:id", findById);
router.put("/customers/:id", validSchemaCustomer, update);

export default router;
