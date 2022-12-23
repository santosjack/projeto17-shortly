
import { userSchema, credentialsSchema } from "../models/Auth.js";


export function userSchemaValidation(req, res, next) {
  const user = req.body;

  const { error } = userSchema.validate(user, { abortEarly: false });

  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  console.log(user);

  res.locals.user = user;

  next();
}

export async function signInBodyValidation(req, res, next) {
  const credentials = req.body;

  const { error } = credentialsSchema.validate(credentials, { abortEarly: false });

  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  res.locals.user = user;

  next();
}

export async function authRoutesValidation(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }

/*   try {
    const session = await sessions.findOne({ token });
    if (!session) {
      return res.sendStatus(401);
    }
    const user = await users.findOne({ _id: session?.userId });
    if (!user) {
      return res.sendStatus(401);
    }

    res.locals.user = user;
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  } */

  next();
}
