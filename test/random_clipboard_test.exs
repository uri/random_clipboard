defmodule RandomClipboardTest do
  import RandomClipboard
  use ExUnit.Case, async: true
  doctest RandomClipboard

  describe "random_hex/1" do
    test "returns a random hex of the given size" do
      size = 4
      assert (size |> random_hex |> String.length) == size
    end

    test "returns a random result" do
      first = random_hex(10)
      second = random_hex(10)
      assert first != second
    end

    test "does not contain any capitals" do
      hex_containing_alpha = generate_random_hex_until_alpha(10)
      assert Regex.match?(~r/^[a-z0-9]+$/, hex_containing_alpha) == true
    end

    defp generate_random_hex_until_alpha(size) do
      rand = random_hex(size)
      case Regex.match?(~r/\w/, rand) do
        true -> rand
        false -> generate_random_hex_until_alpha(size)
      end
    end
  end

  describe "generate_email/2" do
    test "returns and email with a random suffix" do
      rand_len = 2
      user = "user"
      rand_email = generate_email(["user", "example.com"], rand_len)
      <<"user+", rand :: binary-size(rand_len), "@example.com" >> = rand_email
      assert String.length(rand) == rand_len
    end
  end

end
