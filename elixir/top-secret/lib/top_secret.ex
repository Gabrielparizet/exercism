defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({operation, _, list_of_arguments} = ast, acc)
    when operation in [:def, :defp], do: {ast, [ get_name(list_of_arguments) | acc ]}

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

    defp get_name(list_of_arguments) do
      {operation, _, _args} = Enum.at(list_of_arguments, 0)
      Atom.to_string(operation)
    end

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
