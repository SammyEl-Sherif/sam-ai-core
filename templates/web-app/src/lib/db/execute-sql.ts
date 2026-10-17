import fs from "node:fs/promises";
import path from "node:path";
import { Pool, type QueryResultRow } from "pg";

let pool: Pool | null = null;

function getPool(): Pool {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error("DATABASE_URL is not set");
  }
  if (!pool) {
    pool = new Pool({ connectionString, max: 5 });
  }
  return pool;
}

export async function executeSqlFile<T extends QueryResultRow>(
  sqlFilePath: string,
  params: unknown[] = [],
): Promise<T[]> {
  const resolved = path.isAbsolute(sqlFilePath)
    ? sqlFilePath
    : path.join(process.cwd(), sqlFilePath);
  const sql = await fs.readFile(resolved, "utf-8");
  const result = await getPool().query<T>(sql, params);
  return result.rows;
}
