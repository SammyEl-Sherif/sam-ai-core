import styles from "./HeroTitle.module.scss";

type HeroTitleProps = {
  title: string;
  subtitle: string;
};

export function HeroTitle({ title, subtitle }: HeroTitleProps) {
  return (
    <div>
      <h2 className={styles.title}>{title}</h2>
      <p className={styles.subtitle}>{subtitle}</p>
    </div>
  );
}
