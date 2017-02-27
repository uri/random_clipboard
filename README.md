# RandomClipboard

Copy things to your clipboard with a bit of randomness.

## Usage

```shell
reg youremail@example.com
```

Output:

```
youremail+23ef@example
```

The value is also copied to your system clipboard on Mac OS.

The output is not followed by a new line character so it should be easy to pipe the output to your operating system's clipboard command.

## Installation

### mix (recommended)

[Install elixir](http://elixir-lang.org/install.html#distributions)

```shell
mix escript.install github uri/random_clipboard
```

If this is your first `escript` follow the post install instructions:

>For convenience, consider adding ~/.mix/escripts directory to your PATH environment variable. For more information, check the wikipedia article on PATH: https://en.wikipedia.org/wiki/PATH_(variable)

### Erlang

`escripts` built with Elixir only need erlang to run. Install erlang and download the latest release.
