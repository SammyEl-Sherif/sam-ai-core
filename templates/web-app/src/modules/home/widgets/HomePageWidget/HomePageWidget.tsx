import { PageShell } from "@/components";
import { Button } from "@/design-system";
import { HeroTitle } from "../../entries";
import styles from "./HomePageWidget.module.scss";

export function HomePageWidget() {
  return (
    <PageShell title="__APP_TITLE__">
      <HeroTitle
        title="__APP_TITLE__"
        subtitle="__APP_DESCRIPTION__"
      />
      <div className={styles.actions}>
        <Button>Get started</Button>
        <Button variant="secondary">Learn more</Button>
      </div>
    </PageShell>
  );
}
