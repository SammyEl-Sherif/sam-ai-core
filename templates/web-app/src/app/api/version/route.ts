export async function GET() {
  const sha = process.env.NEXT_PUBLIC_GIT_SHA ?? "unknown";
  return new Response(sha, {
    status: 200,
    headers: { "Content-Type": "text/plain; charset=utf-8" },
  });
}
