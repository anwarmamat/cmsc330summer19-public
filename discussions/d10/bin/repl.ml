open D9.Lexer
open D9.Parser
open D10.Evaler

let interpret x =
  try x |> lex |> parse |> eval |> string_of_expr
  with _ -> "term does not evaluate"

let rec main () =
  output_string stdout "> ";
  flush stdout;
  let repl_in = (input_line stdin) in

  output_string stdout "[Lexical] \n";
  repl_in |> interpret |> (output_string stdout);
  output_string stdout "\n";

  output_string stdout "[Dynamic] \n";
  repl_in |> interpret |> (output_string stdout);
  output_string stdout "\n";

  flush stdout;
  main ()

let () = main ()
