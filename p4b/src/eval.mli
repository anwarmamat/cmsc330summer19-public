exception TypeError of string
exception DeclareError of string
exception DivByZeroError

val eval_expr : P4a.SmallCTypes.environment -> P4a.SmallCTypes.expr -> P4a.SmallCTypes.value
val eval_stmt : P4a.SmallCTypes.environment -> P4a.SmallCTypes.stmt -> P4a.SmallCTypes.environment
