import connectionDB from '../database/db.js';
import bcrypt from "bcrypt";
import { v4 as uuidV4 } from "uuid";

export async function signUp(req, res) {
  const user = res.locals.user;
  console.log(user);
  const passwordHash = bcrypt.hashSync(user.password, 10);

  try {
    console.log("vim até o controller");
    const { rows } = await connectionDB.query(
      "SELECT * FROM users WHERE email = $1", [user.email]
    );

    console.log(rows)
    
    if (rows.length > 0) {
        return res.status(409).send("usuário existente!")
    }
    console.log("testei o result passei do getEmail");
    
    await connectionDB.query(
      "INSERT INTO users (name, email, password) VALUES ($1, $2, $3)",
      [user.name, user.email, passwordHash]
    );
    res.status(201).send("Ok");
  } catch (error) {
    res.sendStatus(500);
  }
}

export async function signIn(req, res) {
  const user = res.locals.user;
  
  try {

      const { rows } = await connectionDB.query(
        "SELECT * FROM users WHERE email = $1", [user.email]
      );

      console.log(rows);
      const isValidPassword = bcrypt.compareSync(user.password, rows[0].password);

      if (rows.length < 1 || !isValidPassword) {
          return res.status(401).send("Verifique as credenciais digitadas!");
      }
      const userId = rows[0].id;

      const token = uuidV4();
     
      await connectionDB.query(
        'INSERT INTO sessions (token, "userId") VALUES ($1, $2)',
        [token, userId]
      );
      
      res.status(200).send(token);
  } catch (error) {
      res.sendStatus(500);
  }
}

