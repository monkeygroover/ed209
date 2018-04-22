# Ed209

An Elixir/Erlang nif wrapper to call Ed25519 functions in rust available from (https://github.com/dalek-cryptography/ed25519-dalek)

This is currently only a very basic POC.

+## Installation
+
The package is available in hex and can be installed
+by adding `ed209` to your list of dependencies in `mix.exs`:
+
+```elixir
+def deps do
+  [
+    {:ed209, "~> 0.1.0"}
+  ]
+end
+```

# Credits

uses [Dalek-ed25519](https://github.com/dalek-cryptography/ed25519-dalek) rust crate for [Ed-25519](https://ed25519.cr.yp.to/) functions
and [Rustler](https://github.com/hansihe/rustler) for generating the rust/nif interop
