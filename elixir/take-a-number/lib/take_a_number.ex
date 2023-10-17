defmodule TakeANumber do
  def start() do
    pid = spawn(fn -> "" end)
    send(pid, :state)
    receive do
      msg -> msg
    end
  end
end
