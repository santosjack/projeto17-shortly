import pg from "pg";
import dotenv from "dotenv";
dotenv.config();

const { Pool } = pg;

const connectionDB = new Pool({
  //connectionString: process.env.DATABASE_URL,
  connectionString: "postgresql://postgres:31126245@localhost:5432/shortly",
});


export default connectionDB;