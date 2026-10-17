import { render, screen } from "@testing-library/react";
import { HomePageWidget } from "./HomePageWidget";

describe("HomePageWidget", () => {
  it("renders primary actions", () => {
    render(<HomePageWidget />);
    expect(screen.getByRole("button", { name: "Get started" })).toBeInTheDocument();
    expect(screen.getByRole("button", { name: "Learn more" })).toBeInTheDocument();
  });
});
