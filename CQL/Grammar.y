--preamble

{
module Grammar where
import Tokens
}



%name parser
%tokentype {Token}
%error {parseError}



%token
  input {TokenInput}
  out {TokenOut}
  where {TokenWhere}
  nothing {TokenNothing}
  var {TokenVar $$}
  filename {TokenFilename $$}
  key {TokenKey $$}
  '?' {TokenQMark}
  ':' {TokenColon}
  ';' {TokenSColon}
  ',' {TokenComma}
  "==" {TokenEq}                   --idk how to match multiple symbols
  "!=" {TokenNEq}



--space for associations





--productions

--i thought a production and token with the same
--name would be confusing, so the expressions have Exp at the end

--all these productions will need actions

%%
Prog : input InputExp WhereExp out OutExp    {}
     | input InputExp out OutExp             {}

InputExp : CSV_File ';' InputExp             {}
         | CSV_File ';'                      {}

OutExp : OutExp ',' OutExp                   {}
       | InlineIf                            {}
       | key                                 {}

CSV_File : filename ':' Keys                 {}

Keys : key ',' Keys                          {}
     | key                                   {}

WhereExp : where Condition                   {Where $1}

InlineIf : Condition '?' key ':' key         {InlineIf $1 $3 $5}

Condition : Operand ConditionOp Operand      {Condition $1 $2 $3}

ConditionOp : "=="                           {ConditionOp Eq}
            | "!="                           {ConditionOp NEq}

Operand : key                                {Operand $1}
        | nothing                            {Operand Nothing}



--postamble

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"

data Where = Condition

data InlineIf = Condition Key Key

data Condition = Operand ConditionOp Operand
data Operand = Key | Nothing
data ConditionOp = Eq | NEq

type Nothing = ""
}