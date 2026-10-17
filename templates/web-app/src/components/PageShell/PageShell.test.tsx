import { render, screen } from "@testing-library/react";
import { PageShell } from "./PageShell";

describe("PageShell", () => {
  it("renders title and children", () => {
    render(
      <PageShell title="Test App">
        <p>Body</p>
      </PageShell>,
    );
    expect(screen.getByRole("heading", { name: "Test App" })).toBeInTheDocument();
    expect(screen.getByText("Body")).toBeInTheDocument();
  });
});
