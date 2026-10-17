import type { NextConfig } from "next";

const gitSha =
  process.env.VERCEL_GIT_COMMIT_SHA ??
  process.env.GIT_SHA ??
  "development";

const nextConfig: NextConfig = {
  env: {
    NEXT_PUBLIC_GIT_SHA: gitSha,
  },
  sassOptions: {
    includePaths: ["./src/design-system"],
  },
};

export default nextConfig;
