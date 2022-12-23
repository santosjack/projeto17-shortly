import pg from "pg";
import dotenv from "dotenv";
dotenv.config();

const { Pool } = pg;

const connectionDB = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: true
  //host: "localhost",
  //port: "5432",
  //user: "postgres",
  //password: "31126245",
  //database: "shortly"
});


export default connectionDB;