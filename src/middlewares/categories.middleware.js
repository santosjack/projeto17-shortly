import { categorieSchemma } from "../models/Categories.js";
import { connectionDB } from "../database/db.js";

export async function validSchemaCategories(req, res, next) {
  const categorie = req.body;

  const { error } = categorieSchemma.validate(categorie, { abortEarly: false });

  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(400).send({ errors });
  }

  const categorieExists = await connectionDB.query(
    "SELECT * FROM categories WHERE name=$1",
    [categorie.name]
  );

  if (categorieExists.rowCount !== 0) {
    return res.sendStatus(409);
  }

  res.locals.categorie = categorie;

  next();
}
