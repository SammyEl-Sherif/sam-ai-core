import { render, screen } from "@testing-library/react";
import { HeroTitle } from "./HeroTitle";

describe("HeroTitle", () => {
  it("shows title and subtitle", () => {
    render(<HeroTitle title="Hello" subtitle="World" />);
    expect(screen.getByRole("heading", { name: "Hello" })).toBeInTheDocument();
    expect(screen.getByText("World")).toBeInTheDocument();
  });
});
