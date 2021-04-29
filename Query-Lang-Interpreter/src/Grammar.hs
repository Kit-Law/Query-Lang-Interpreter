{-# OPTIONS_GHC -w #-}
module Grammar where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,143) ([32768,0,0,16,0,8192,0,0,0,0,128,0,1536,0,0,32,0,512,0,512,0,8192,0,0,80,24,2048,0,32768,0,0,40,12,0,0,0,8,0,0,0,1024,48,0,0,0,16128,0,0,0,0,0,0,4,0,160,48,0,0,0,0,0,1024,0,0,192,0,0,0,0,0,1024,0,40960,12288,0,0,0,0,64,20480,6144,0,10,3,256,0,0,4864,0,32768,0,160,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,40960,12288,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,2,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Prog","InputExp","OutExp","OutArg","CSV_File","Keys","WhereExp","InlineIf","Conditions","Condition","ConditionOp","Operand","input","out","where","nothing","filename","string","'?'","':'","';'","','","\"==\"","\"!=\"","'>'","\">=\"","'<'","\"<=\"","\"&&\"","\"||\"","'\"'","'('","')'","%eof"]
        bit_start = st Prelude.* 37
        bit_end = (st Prelude.+ 1) Prelude.* 37
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..36]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (16) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (20) = happyShift action_7
action_2 (5) = happyGoto action_8
action_2 (8) = happyGoto action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (37) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (20) = happyShift action_7
action_4 (5) = happyGoto action_5
action_4 (8) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (17) = happyShift action_13
action_5 (18) = happyShift action_10
action_5 (10) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (24) = happyShift action_12
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (23) = happyShift action_11
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (18) = happyShift action_10
action_8 (10) = happyGoto action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (17) = happyShift action_31
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (19) = happyShift action_28
action_10 (21) = happyShift action_29
action_10 (34) = happyShift action_30
action_10 (35) = happyShift action_23
action_10 (12) = happyGoto action_27
action_10 (13) = happyGoto action_18
action_10 (15) = happyGoto action_19
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (21) = happyShift action_26
action_11 (9) = happyGoto action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (20) = happyShift action_7
action_12 (5) = happyGoto action_24
action_12 (8) = happyGoto action_6
action_12 _ = happyReduce_4

action_13 (19) = happyShift action_20
action_13 (21) = happyShift action_21
action_13 (34) = happyShift action_22
action_13 (35) = happyShift action_23
action_13 (6) = happyGoto action_14
action_13 (7) = happyGoto action_15
action_13 (11) = happyGoto action_16
action_13 (12) = happyGoto action_17
action_13 (13) = happyGoto action_18
action_13 (15) = happyGoto action_19
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_2

action_15 (25) = happyShift action_47
action_15 _ = happyReduce_6

action_16 _ = happyReduce_7

action_17 (22) = happyShift action_46
action_17 (32) = happyShift action_34
action_17 (33) = happyShift action_35
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_16

action_19 (26) = happyShift action_40
action_19 (27) = happyShift action_41
action_19 (28) = happyShift action_42
action_19 (29) = happyShift action_43
action_19 (30) = happyShift action_44
action_19 (31) = happyShift action_45
action_19 (14) = happyGoto action_39
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (26) = happyReduce_28
action_20 (27) = happyReduce_28
action_20 (28) = happyReduce_28
action_20 (29) = happyReduce_28
action_20 (30) = happyReduce_28
action_20 (31) = happyReduce_28
action_20 _ = happyReduce_10

action_21 (26) = happyReduce_27
action_21 (27) = happyReduce_27
action_21 (28) = happyReduce_27
action_21 (29) = happyReduce_27
action_21 (30) = happyReduce_27
action_21 (31) = happyReduce_27
action_21 _ = happyReduce_8

action_22 (21) = happyShift action_38
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (19) = happyShift action_28
action_23 (21) = happyShift action_29
action_23 (34) = happyShift action_30
action_23 (35) = happyShift action_23
action_23 (12) = happyGoto action_37
action_23 (13) = happyGoto action_18
action_23 (15) = happyGoto action_19
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_3

action_25 _ = happyReduce_11

action_26 (25) = happyShift action_36
action_26 _ = happyReduce_13

action_27 (32) = happyShift action_34
action_27 (33) = happyShift action_35
action_27 _ = happyReduce_14

action_28 _ = happyReduce_28

action_29 _ = happyReduce_27

action_30 (21) = happyShift action_33
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (19) = happyShift action_20
action_31 (21) = happyShift action_21
action_31 (34) = happyShift action_22
action_31 (35) = happyShift action_23
action_31 (6) = happyGoto action_32
action_31 (7) = happyGoto action_15
action_31 (11) = happyGoto action_16
action_31 (12) = happyGoto action_17
action_31 (13) = happyGoto action_18
action_31 (15) = happyGoto action_19
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_1

action_33 (34) = happyShift action_56
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (19) = happyShift action_28
action_34 (21) = happyShift action_29
action_34 (34) = happyShift action_30
action_34 (35) = happyShift action_23
action_34 (12) = happyGoto action_55
action_34 (13) = happyGoto action_18
action_34 (15) = happyGoto action_19
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (19) = happyShift action_28
action_35 (21) = happyShift action_29
action_35 (34) = happyShift action_30
action_35 (35) = happyShift action_23
action_35 (12) = happyGoto action_54
action_35 (13) = happyGoto action_18
action_35 (15) = happyGoto action_19
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_26
action_36 (9) = happyGoto action_53
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (32) = happyShift action_34
action_37 (33) = happyShift action_35
action_37 (36) = happyShift action_52
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (34) = happyShift action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (19) = happyShift action_28
action_39 (21) = happyShift action_29
action_39 (34) = happyShift action_30
action_39 (15) = happyGoto action_50
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_21

action_41 _ = happyReduce_22

action_42 _ = happyReduce_23

action_43 _ = happyReduce_24

action_44 _ = happyReduce_25

action_45 _ = happyReduce_26

action_46 (21) = happyShift action_49
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_20
action_47 (21) = happyShift action_21
action_47 (34) = happyShift action_22
action_47 (35) = happyShift action_23
action_47 (6) = happyGoto action_48
action_47 (7) = happyGoto action_15
action_47 (11) = happyGoto action_16
action_47 (12) = happyGoto action_17
action_47 (13) = happyGoto action_18
action_47 (15) = happyGoto action_19
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_5

action_49 (23) = happyShift action_57
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_20

action_51 (26) = happyReduce_29
action_51 (27) = happyReduce_29
action_51 (28) = happyReduce_29
action_51 (29) = happyReduce_29
action_51 (30) = happyReduce_29
action_51 (31) = happyReduce_29
action_51 _ = happyReduce_9

action_52 _ = happyReduce_19

action_53 _ = happyReduce_12

action_54 (32) = happyShift action_34
action_54 _ = happyReduce_18

action_55 _ = happyReduce_17

action_56 _ = happyReduce_29

action_57 (21) = happyShift action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_15

happyReduce_1 = happyReduce 5 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ProgW happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 4 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ProgNW happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 (InputNT happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 (InputT happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (OutputNT happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (OutputT happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (OutArgIf happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyTerminal (TokenString _  happy_var_1))
	 =  HappyAbsSyn7
		 (OutArgKey happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 _
	(HappyTerminal (TokenString _  happy_var_2))
	_
	 =  HappyAbsSyn7
		 (OutArgConst happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn7
		 (OutArgNothing
	)

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenFilename _  happy_var_1))
	 =  HappyAbsSyn8
		 (File happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenString _  happy_var_1))
	 =  HappyAbsSyn9
		 (KeysNT happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyTerminal (TokenString _  happy_var_1))
	 =  HappyAbsSyn9
		 (KeysT happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TmWhere happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 5 11 happyReduction_15
happyReduction_15 ((HappyTerminal (TokenString _  happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _  happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (If happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  12 happyReduction_16
happyReduction_16 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (ConditionsT happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  12 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (ConditionsAnd happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (ConditionsOr happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  13 happyReduction_20
happyReduction_20 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (Condtn happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  14 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn14
		 (Eq
	)

happyReduce_22 = happySpecReduce_1  14 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn14
		 (NEq
	)

happyReduce_23 = happySpecReduce_1  14 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn14
		 (Gt
	)

happyReduce_24 = happySpecReduce_1  14 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn14
		 (GEq
	)

happyReduce_25 = happySpecReduce_1  14 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn14
		 (Lt
	)

happyReduce_26 = happySpecReduce_1  14 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn14
		 (LEq
	)

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 (HappyTerminal (TokenString _  happy_var_1))
	 =  HappyAbsSyn15
		 (OperandKey happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn15
		 (OperandNothing
	)

happyReduce_29 = happySpecReduce_3  15 happyReduction_29
happyReduction_29 _
	(HappyTerminal (TokenString _  happy_var_2))
	_
	 =  HappyAbsSyn15
		 (OperandConst happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 37 37 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInput _ -> cont 16;
	TokenOut _ -> cont 17;
	TokenWhere _ -> cont 18;
	TokenNothing _ -> cont 19;
	TokenFilename _  happy_dollar_dollar -> cont 20;
	TokenString _  happy_dollar_dollar -> cont 21;
	TokenQMark _ -> cont 22;
	TokenHasColumns _ -> cont 23;
	TokenTerminator _ -> cont 24;
	TokenKeySep _ -> cont 25;
	TokenEq _ -> cont 26;
	TokenNEq _ -> cont 27;
	TokenGT _ -> cont 28;
	TokenGEq _ -> cont 29;
	TokenLT _ -> cont 30;
	TokenLEq _ -> cont 31;
	TokenAnd _ -> cont 32;
	TokenOr _ -> cont 33;
	TokenSMark _ -> cont 34;
	TokenLParen _ -> cont 35;
	TokenRParen _ -> cont 36;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 37 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError []     = error "Parse Error"
--parseError (t:ts) = error $ "Unparsed tokens: " ++ show (t:ts)
parseError (t:ts) = error $ "-------------CSVQL Error---------------\n" ++
                            "Parse Error at line:column " ++ (tokenPosn t) ++ "\n" ++
                            suggestion(t:ts) ++ "\n\n\n" ++
                            "------Corresponding Grammar Error------"


suggestion :: [Token] -> String
suggestion ((TokenFilename _ _):_) = "Filename was unparsed, possible missing ';'"
suggestion ((TokenOut _):_)        = "OUTPUT statement unparsed, possible missing terminator ';'"
suggestion ((TokenString _ _):(TokenHasColumns _):_) = "Filename parsed incorrectly, check file name is spelt correctly"
suggestion ((TokenString _ _):(TokenKeySep _):_) = "Key parsed incorrectly, possible missing key seperator ','"
suggestion ((TokenString _ s):_) = "Failed to parse " ++ s


--showTokens :: [Token] -> Int -> String
--showTokens (t:[]) _ = show t
--showTokens (t:ts) 1 = show t
--showTokens (t:ts) n = show t ++ showTokens ts (n-1)



data Prog = ProgNW Input Output | ProgW Input Where Output
    deriving (Show, Eq)

data Input = InputNT CsvFile Input | InputT CsvFile
    deriving (Show, Eq)

data Output = OutputNT OutArg Output | OutputT OutArg
    deriving (Show, Eq)

data OutArg = OutArgIf InlineIf | OutArgKey Key | OutArgConst String | OutArgNothing
    deriving (Show, Eq)

data CsvFile = File Filename Keys
    deriving (Show, Eq)

type Filename = String

data Keys = KeysNT Key Keys | KeysT Key
    deriving (Show, Eq)

type Key = String
    
data Where = TmWhere Conditions
    deriving (Show, Eq)

data InlineIf = If Conditions Key Key
    deriving (Show, Eq)

data Conditions = ConditionsT Condition | ConditionsAnd Conditions Conditions | ConditionsOr Conditions Conditions
    deriving (Show, Eq)

data Condition = Condtn Operand ConditionOp Operand
    deriving (Show, Eq)

data Operand = OperandKey Key | OperandNothing | OperandConst String
    deriving (Show, Eq)

data ConditionOp = Eq | NEq | Gt | GEq | Lt | LEq
    deriving (Show, Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
