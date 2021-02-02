defmodule SurfaceBulma.Modal.Card do
  use Surface.Component
  alias SurfaceBulma.Button

  @moduledoc """
  The card **modal**, with various configuration options.
  The modal is a stateless component and as such requires outside
  handling of whether or not the modal should be shown.

  This component is currently not usable with javascript control of
  if component should be shown or not.
  """

  @doc "If modal should be shown or not, defaults to false"
  prop(show, :boolean, default: false)

  @doc "If modal should show close button at top right of card"
  prop(show_close_button, :boolean, default: true)

  @doc "Header content, use via Modal.Header"
  slot(header)

  @doc "Footer content, use via Modal.Footer"
  slot(footer)

  @doc "Default slot"
  slot(default, required: true)

  def render(assigns) do
    ~H"""
    <div class={{ "modal", "is-active": @show }}>
      <div class="modal-background"></div>
      <div class="modal-card">
        <header :if={{@show_close_button}} class="modal-card-head">
          <p :if={{slot_assigned?(:header)}} class="modal-card-title"><slot name="header"/></p>
          <Button :if={{@show_close_button}} type={{nil}} class="delete" aria_label="close"></Button>
        </header>
        <section class="modal-card-body">
          <slot/>
        </section>
        <footer :if={{slot_assigned?(:footer)}} class="modal-card-foot" style="justify-content: flex-end">
        <slot name="footer"/>
        </footer>
      </div>
    </div>
    """
  end
end
