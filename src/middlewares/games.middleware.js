import { connectionDB } from "../database/db.js";
import { gameSchemma } from "../models/Games.js";

export async function validSchemaGames(req, res, next) {
  const game = req.body;

  const { error } = gameSchemma.validate(game, { abortEarly: false });

  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(400).send({ errors });
  }

  const idCategorieExists = await connectionDB.query(
    "SELECT * FROM categories WHERE id=$1",
    [game.categoryId]
  );

  if (idCategorieExists.rowCount === 0) {
    return res.sendStatus(400);
  }

  const gameNameExists = await connectionDB.query(
    "SELECT * FROM games WHERE name=$1",
    [game.name]
  );

  if (gameNameExists.rowCount !== 0) {
    return res.sendStatus(409);
  }

  res.locals.game = game;

  next();
}
