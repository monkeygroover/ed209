defmodule Ed209.MixProject do
  use Mix.Project

  def project do
    [
      app: :ed209,
      version: "0.1.0",
      elixir: "~> 1.6",
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      deps: deps(),
      name: "ed209",
      source_url: "https://github.com/monkeygroover/ed209"
    ]
  end

  defp rustler_crates do
    [io: [
      path: "native/ed209",
      mode: (if Mix.env == :prod, do: :release, else: :debug),
    ]]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.16.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    """
    An Elixir/Erlang nif wrapper to call Ed25519 functions in rust from https://github.com/dalek-cryptography/ed25519-dalek

    Requires rust/cargo to build the native nif library; see: https://rustup.rs/

    This is currently only a very basic POC.
    """
  end

  defp package() do
    [
      files: ["config", "lib", "native/ed209/src", "native/ed209/Cargo.*", "test", "README.md", "LICENSE", "mix.exs", "mix.lock"],
      maintainers: ["Richard Bowker"],
      licenses: ["The Unlicense"],
      links: %{"GitHub" => "https://github.com/monkeygroover/ed209"}
    ]
  end
end
