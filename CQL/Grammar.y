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
  '=' {TokenEq}
  "!=" {TokenNEq}



--space for associations





--productions

--i thought a production and token with the same
--name would be confusing, so the expressions have Exp at the end

--all these productions will need actions

%%
Prog : input InputExp WhereExp out OutExp
     | input InputExp out OutExp

InputExp : CSV_File ';' InputExp
         | CSV_File ';'

OutExp : OutExp ',' OutExp
       | InlineIf
       | key

CSV_File : filename ':' Keys

Keys : key ',' Keys
     | key

WhereExp : 

InlineIf : Condition '?' key ':' key

Condition : 

ConditionOp : 

Operand : 



--postamble

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"
}