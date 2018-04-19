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
    ]
  end
end
