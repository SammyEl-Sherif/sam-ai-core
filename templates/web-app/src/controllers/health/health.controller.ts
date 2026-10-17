import path from "node:path";
import { executeSqlFile } from "@/lib/db/execute-sql";

const sqlDir = path.join(process.cwd(), "src/controllers/health/sql");

export async function pingDatabase(): Promise<boolean> {
  try {
    await executeSqlFile(path.join(sqlDir, "ping.sql"));
    return true;
  } catch {
    return false;
  }
}
