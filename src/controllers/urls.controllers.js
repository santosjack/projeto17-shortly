import connectionDB from '../database/db.js';
import { nanoid } from 'nanoid';

export async function addUrl(req, res) {
    const { url } = res.locals.url;
    const userId = res.locals.user;

    const shortUrl = nanoid(8);
    console.log(shortUrl);

    try {
        await connectionDB.query(
            'INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3)',
            [url, shortUrl, userId]
        );
        res.status(201).send({ shortUrl });
    } catch (error) {
        res.sendStatus(500)
    }
}

export async function getUrlById(req, res) {
    const { id } = req.params;

    console.log(id)

    try {
        const { rows: foundUrls } = await connectionDB.query(
            "SELECT * FROM urls WHERE id = $1", [id]
        );

        if (foundUrls.length < 1) {
            return res.status(404).send("URL não encontrada");
        }

        const [data] = foundUrls;


        res.status(201).send({ id: data.id, url: data.url, shortUrl: data.shortUrl });


    } catch (error) {
        res.sendStatus(500)
    }
}

export async function getUrl(req, res) {
    const { shortenUrl } = req.params;

    console.log(shortenUrl);

    try {
        const { rows: foundUrls } = await connectionDB.query(
            'SELECT * FROM urls WHERE "shortUrl" = $1', [shortenUrl]
        );

        if (foundUrls.length < 1) {
            return res.status(404).send("URL não encontrada");
        }

        const [data] = foundUrls;

        console.log(data);

        await connectionDB.query(
            `UPDATE urls SET "visitCount" = "visitCount" + 1
             WHERE id = $1`, [data.id]
        );

        res.redirect(data.url);

    } catch (error) {
        res.sendStatus(500)
    }
}

export async function removeUrl(req, res) {
    const { id } = req.params;
    const userId = res.locals.user;

    try {
        const { rows: foundUrls } = await connectionDB.query(
            "SELECT * FROM urls WHERE id = $1", [id]
        );

        if (foundUrls.length < 1) {
            return res.status(404).send("URL não encontrada");
        }

        const [data] = foundUrls;

        if (userId !== data.userId) {
            return res.sendStatus(401);
        }

        await connectionDB.query(
            'DELETE FROM urls WHERE id = $1', [id]
        );

        res.status(204).send("URL removida com sucesso.");

    } catch (error) {
        res.sendStatus(500)
    }
}

export async function getRanking(req, res) {

    try {
        const { rows: data } = await connectionDB.query(
        `   SELECT users.id, users.name,
            COUNT(urls."shortUrl") as "linksCount",
            SUM(COALESCE(urls."visitCount", 0)) as "visitCount"
            FROM users 
            LEFT JOIN urls ON users.id = urls."userId"
            GROUP BY users.id
            ORDER BY "visitCount" DESC LIMIT 10
        `
        );

        res.status(200).send(data);

    } catch (error) {
        res.sendStatus(500)
    }
}



