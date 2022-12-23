import connectionDB from '../database/db.js';
import { nanoid } from 'nanoid';

export async function addUrl(req, res) {
  const {url} = res.locals.url;
  const userId = res.locals.user;

  const shortUrl = nanoid(8);
  console.log(shortUrl);

    try {
        await connectionDB.query(
            'INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3)',
            [url, shortUrl, userId]
        );
        res.status(201).send({shortUrl});
    } catch (error) {
        res.sendStatus(500)
    }
}

export async function getUrlById(req, res) {
    const { id } = req.params;

    console.log(id)
  
      try {
          const { rows: foundUrls} = await connectionDB.query(
            "SELECT * FROM urls WHERE id = $1", [id]
          );

          if(foundUrls.length < 1){
            return res.status(404).send("URL não encontrada");
          }

          const [ data ] = foundUrls;


          res.status(201).send({ id: data.id, url: data.url, shortUrl: data.shortUrl});

          
      } catch (error) {
          res.sendStatus(500)
      }
  }

  export async function getUrl(req, res) {
    const { shortUrl } = req.params;

    console.log(shortUrl);
  
      try {
          const { rows: foundUrls} = await connectionDB.query(
            'SELECT * FROM urls WHERE "shortUrl" = $1', [shortUrl]
          );

          if(foundUrls.length < 1){
            return res.status(404).send("URL não encontrada");
          }

          const [ data ] = foundUrls;

          console.log(data);

          res.status(201).send({ id: data.id, url: data.url, shortUrl: data.shortUrl});

          
      } catch (error) {
          res.sendStatus(500)
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

