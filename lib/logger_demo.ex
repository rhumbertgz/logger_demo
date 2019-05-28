defmodule LoggerDemo do
  @moduledoc """
  Custom Logger Formatter Demo
  """
  require Logger

  def test do
    Logger.info "Demo"
    Logger.info "Basic" , output: :inner

    Logger.debug "Demo"
    Logger.debug "Basic" , output: :inner

    Logger.error "Demo"
    Logger.error "Basic" , output: :inner
  end
end
