defmodule Ed209Test do
  use ExUnit.Case
  doctest Ed209

  test "greets the world" do
    result = Ed209.verify_signature("dsf", "dsfdsf", "dsfsdf")
    IO.inspect result
    assert(result == {:ok, true})
  end
end
