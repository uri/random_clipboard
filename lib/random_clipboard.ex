defmodule RandomClipboard do
  @moduledoc """
  """

  @doc """
  """
  def generate_email([email, domain], randomness) do
    "#{email}+#{random_hex(randomness)}@#{domain}"
  end

  @doc """

  """
  @spec random_hex(number) :: String.t
  def random_hex(size) when is_number(size) and size > 0 do
    size / 2
    |> round
    |> :crypto.rand_bytes
    |> Base.encode16()
    |> String.downcase
  end
end
