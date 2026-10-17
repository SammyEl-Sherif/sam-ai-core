import type { Metadata } from "next";
import { Analytics } from "@vercel/analytics/react";
import "./globals.scss";

export const metadata: Metadata = {
  title: {
    default: "__APP_TITLE__",
    template: "%s · __APP_TITLE__",
  },
  description: "__APP_DESCRIPTION__",
  metadataBase: process.env.NEXT_PUBLIC_SITE_URL
    ? new URL(process.env.NEXT_PUBLIC_SITE_URL)
    : undefined,
  openGraph: {
    title: "__APP_TITLE__",
    description: "__APP_DESCRIPTION__",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        {children}
        <Analytics />
      </body>
    </html>
  );
}
