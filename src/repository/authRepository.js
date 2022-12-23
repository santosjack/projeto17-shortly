import connection from "../database/db.js";

async function getUserByEmail(email){
    return await connection.query(
        "SELECT * FROM users WHERE email = $1", [email]
    )
}
async function getUserById(id){
    return await connection.query(
        "SELECT * FROM users WHERE id = $1", [id]
    )
}

async function addUser(name, email, password){
    await connection.query(
        `
        INSERT INTO users (name, email, password) 
        VALUES ('${name}', '${email}', '${password}')
        `
    )
}
async function addSession(token, userId){
    return await connection.query(
        `INSERT INTO sessions (token, "userId") 
        VALUES ('${token}', ${userId})
        `
    )
}
async function getUserData(id){
    return await connection.query(
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