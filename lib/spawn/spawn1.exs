defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end
pid = spawn(Spawn1, :greet, [])
 send pid, {self(), "world!"}
receive do
  {:ok, message} ->
    IO.puts message
end
end
