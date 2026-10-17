import styles from "./PageShell.module.scss";

type PageShellProps = {
  title: string;
  children: React.ReactNode;
};

export function PageShell({ title, children }: PageShellProps) {
  return (
    <div className={styles.shell}>
      <header className={styles.header}>
        <h1 className={styles.title}>{title}</h1>
      </header>
      <main className={styles.main}>{children}</main>
    </div>
  );
}
