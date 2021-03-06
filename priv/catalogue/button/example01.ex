defmodule SurfaceBulma.Catalogue.Button.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Button,
    catalogue: SurfaceBulma.Catalogue,
    title: "Label",
    height: "90px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~H"""
    <Button label="Label"/>
    <Button>Slot</Button>
    """
  end
end
