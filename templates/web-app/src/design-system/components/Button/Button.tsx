import styles from "./Button.module.scss";

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: "primary" | "secondary";
};

export function Button({
  variant = "primary",
  className,
  ...props
}: ButtonProps) {
  const classes = [
    styles.button,
    variant === "secondary" ? styles.secondary : "",
    className,
  ]
    .filter(Boolean)
    .join(" ");

  return <button type="button" className={classes} {...props} />;
}
