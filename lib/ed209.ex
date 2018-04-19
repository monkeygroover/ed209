defmodule Ed209 do
  use Rustler, otp_app: :ed209

  def verify_signature(_public_key, _signature, _message), do: exit(:nif_not_loaded)
end
