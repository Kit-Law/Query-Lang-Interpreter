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
  filename {TokenFilename $$}
  key {TokenKey $$}
  '?' {TokenQMark}
  ':' {TokenHasColumns}
  ';' {TokenTerminator}
  ',' {TokenKeySep}
  "==" {TokenEq}                   --idk how to match multiple symbols
  "!=" {TokenNEq}



--space for associations





--productions

--i thought a production and token with the same
--name would be confusing, so the expressions have Exp at the end

--all these productions will need actions

%%
Prog : input InputExp WhereExp out OutExp    {$2 $3 $5}
     | input InputExp out OutExp             {$2 $4}

InputExp : CSV_File ';' InputExp             {Input $1 $3}
         | CSV_File ';'                      {Input $1}

OutExp : OutExp ',' OutExp                   {Output $1 $3}
       | InlineIf                            {Output $1}
       | key                                 {Output $1}

CSV_File : filename ':' Keys                 {CsvFile $1 $3}

Keys : key ',' Keys                          {Keys $1 $3}
     | key                                   {Key $1}

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


data Prog = Input Output | Input Where Output

data Input = CsvFile Input | CsvFile
data Output = Output Output | InlineIf | Key

data CsvFile = Filename Keys
type Filename = String

data Keys = Key Keys | Key
type Key = String

data Where = Condition
data InlineIf = Condition Key Key
data Condition = Operand ConditionOp Operand
data Operand = Key | Nothing
data ConditionOp = Eq | NEq

type Nothing = ""
}