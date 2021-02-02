defmodule SurfaceBulma.Modal.Card do
  use Surface.Component

  alias SurfaceBulma.Button

  prop(show, :boolean, default: false)
  prop(show_close_button, :boolean, default: true)
  slot(header)
  slot(footer)
  slot(default, required: true)

  def render(assigns) do
    ~H"""
    <div class={{ "modal", "is-active": @show }}>
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title"><slot name="header"/></p>
          <Button type={{nil}} class="delete" aria_label="close"></Button>
        </header>
        <section class="modal-card-body">
          <slot/>
        </section>
        <footer class="modal-card-foot" style="justify-content: flex-end">
        <slot name="footer"/>
        </footer>
      </div>
    </div>
    """
  end
end
