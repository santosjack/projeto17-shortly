import connectionDB from "../database/db.js";

async function getUserByEmail(email){
    return await connectionDB.query(
        "SELECT * FROM users WHERE email = $1", [email]
    )
}
async function getUserById(id){
    return await connectionDB.query(
        "SELECT * FROM users WHERE id = $1", [id]
    )
}

async function addUser(name, email, password){
    return await connectionDB.query(
        `
        INSERT INTO users (name, email, password) 
        VALUES ('${name}', '${email}', '${password}')
        `
    )
}
async function addSession(token, userId){
    return await connectionDB.query(
        `INSERT INTO sessions (token, "userId") 
        VALUES ('${token}', ${userId})
        `
    )
}
async function getUserData(id){
    return await connectionDB.query(
        `
            SELECT users.*, COUNT(u."visitCount") as "visitCount"
            FROM users
            JOIN urls u
            ON users.id = u."userId"
            WHERE users.id = $1
        `, [id]
    )
}
export {
    getUserByEmail, 
    getUserById,
    addUser,
    addSession,
    getUserData
};