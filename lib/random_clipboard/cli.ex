defmodule RandomClipboard.CLI do
  @help """
  Usage: reg user@example.com

  --length | -l
      The amount of random characters to put in the email

  """

  def main(args \\ []) do
    aliases = [l: :length]
    strict = [length: :integer]
    {switches, param, _invalid} = OptionParser.parse(args, strict: strict, aliases: aliases)

    with result  <- run(param, switches),
         os_type <- :os.type,
        :ok      <- copy(:os.type, result) do
      IO.write(result)
    end

  end

  def run([param], [length: length]) do
    email = String.split(param, "@")
    RandomClipboard.generate_email(email, length)
  end
  def run(param, []), do: run(param, length: 2)
  def run(_, _), do: @help


  def copy({:unix, :darwin}, value) do
    port = Port.open({:spawn, "pbcopy"}, [:binary])
    send port, {self(), {:command, value}}
    send port, {self(), :close}
    :ok
  end
  def copy(_not_supported_os, value), do: value
end
