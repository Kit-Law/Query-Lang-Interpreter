--preamble

{
module Grammar where
import Lexer
}



%name parser
%tokentype {Token}
%error {parseError}



%token
  input    {TokenInput}
  out      {TokenOut}
  where    {TokenWhere}
  nothing  {TokenNothing}
  filename {TokenFilename $$}
  key      {TokenKey $$}
  '?'      {TokenQMark}
  ':'      {TokenHasColumns}
  ';'      {TokenTerminator}
  ','      {TokenKeySep}
  "=="     {TokenEq}
  "!="     {TokenNEq}



--space for associations

%nonassoc input out where
%left ';'
%left nothing filename key
%left '?'
%left "==" "!="
%left ':' ','
%left '(' ')'



--productions

--i thought a production and token with the same
--name would be confusing, so the expressions have Exp at the end

--all these productions will need actions

%%
Prog : input InputExp WhereExp out OutExp    {$2 $3 $5}
     | input InputExp out OutExp             {$2 $4}

InputExp : CSV_File ';' InputExp             {InputNT $1 $3}
         | CSV_File ';'                      {InputT $1}

OutExp : OutExp ',' OutExp                   {OutputNT $1 $3}
       | InlineIf                            {OutputTIf $1}
       | key                                 {OutputTKey $1}

CSV_File : filename ':' Keys                 {File $1 $3}

Keys : key ',' Keys                          {KeysNT $1 $3}
     | key                                   {KeysT $1}

WhereExp : where Condition                   {$2}

InlineIf : Condition '?' key ':' key         {If $1 $3 $5}

Condition : Operand ConditionOp Operand      {Condtn $1 $2 $3}

ConditionOp : "=="                           {Eq}
            | "!="                           {NEq}

Operand : key                                {OperandKey $1}
        | nothing                            {OperandNothing Null}



--postamble

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"


data Prog = ProgNW Input Output | ProgW Input Where Output

data Input = InputNT CsvFile Input | InputT CsvFile
data Output = OutputNT Output Output | OutputTIf InlineIf | OutputTKey Key

data CsvFile = File Filename Keys
type Filename = String

data Keys = KeysNT Key Keys | KeysT Key
type Key = String

type Where = Condition
data InlineIf = If Condition Key Key
data Condition = Condtn Operand ConditionOp Operand
data Operand = OperandKey Key | OperandNothing Nothing
data ConditionOp = Eq | NEq

data Nothing = Null
}