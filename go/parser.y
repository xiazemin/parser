%{

//TODO Put your favorite license here
		
// yacc source generated by ebnf2y[1]
// at 2013-08-22 16:07:03.259075861 +0200 CEST.
//
// CAUTION: If this file is a Go source file (*.go), it was generated
// automatically by '$ go tool yacc' from a *.y file - DO NOT EDIT in that case!
// 
//   [1]: http://github.com/cznic/ebnf2y

package parser //TODO real package name

//TODO required only be the demo _dump function
import (
	"bytes"
	"fmt"
	"strings"

	"github.com/cznic/strutil"
)

%}

%union {
	item interface{} //TODO insert real field(s)
}

%token	ANDAND
%token	ANDNOT
%token	ASSIGN_OP
%token	CHANCOMM
%token	COMM
%token	COMMCHAN
%token	DDD
%token	DEC
%token	EQ
%token	FLOAT_LIT
%token	GE
%token	IDENTIFIER
%token	IDENTIFIER_LIST
%token	IDLIST_COLAS
%token	IMAGINARY_LIT
%token	INC
%token	INT_LIT
%token	LBR
%token	LE
%token	LSH
%token	NE
%token	OROR
%token	RSH
%token	RUNE_LIT
%token	STRING_LIT

%type	<item> 	/*TODO real type(s), if/where applicable */
	ANDAND
	ANDNOT
	ASSIGN_OP
	CHANCOMM
	COMM
	COMMCHAN
	DDD
	DEC
	EQ
	FLOAT_LIT
	GE
	IDENTIFIER
	IDENTIFIER_LIST
	IDLIST_COLAS
	IMAGINARY_LIT
	INC
	INT_LIT
	LBR
	LE
	LSH
	NE
	OROR
	RSH
	RUNE_LIT
	STRING_LIT

%token BREAK
%token CASE
%token CHAN
%token CONST
%token CONTINUE
%token DEFAULT
%token DEFER
%token ELSE
%token FALLTHROUGH
%token FOR
%token FUNC
%token GO
%token GOTO
%token IF
%token IMPORT
%token INTERFACE
%token MAP
%token PACKAGE
%token RANGE
%token RETURN
%token SELECT
%token STRUCT
%token SWITCH
%token TYPE
%token VAR

%type	<item> 	/*TODO real type(s), if/where applicable */
	ArgumentList
	ArrayType
	Block
	Condition
	ConstDecl11
	ConstSpec
	Declaration
	Element
	ElementList1
	ElementType
	ExprSwitchStmt2
	ExprSwitchStmt3
	Expression
	ExpressionList
	ExpressionList1
	FieldDecl2
	Function
	IfStmt
	IfStmt2
	ImportDecl11
	ImportSpec
	InterfaceType1
	Label
	LiteralValue
	MapType
	MethodName
	Name
	PackageName
	ParameterDecl
	ParameterDecl1
	ParameterList1
	Parameters
	PrimaryExpr
	Receiver
	RecvExpr
	SelectStmt1
	SendStmt
	Signature
	SimpleStmt
	Slice1
	SliceType
	SourceFile
	SourceFile1
	SourceFile2
	Start
	Statement
	StatementList
	StatementList1
	StructType
	StructType1
	Type
	TypeDecl11
	TypeList1
	TypeLit
	TypeNoName
	TypeSpec
	TypeSwitchStmt2
	UnaryExpr
	VarDecl11
	VarSpec

/*TODO %left, %right, ... declarations */

%left	OROR
%left	ANDAND
%left	'<' '>' EQ GE LE NE
%left	'+' '-' '^' '|'
%left	'%' '&' '*' '/' ANDNOT LSH RSH

%left	notDot // Name
%left	'.'

%start Start //TODO SourceFile

%%

ArgumentList:
	ExpressionList
	{
		$$ = $1 //TODO 1
	}
|	ExpressionList DDD
	{
		$$ = []ArgumentList{$1, $2} //TODO 2
	}

ArrayType:
	'[' Expression ']' ElementType
	{
		$$ = []ArrayType{"[", $2, "]", $4} //TODO 3
	}

Block:
	'{' StatementList '}'
	{
		$$ = []Block{"{", $2, "}"} //TODO 4
	}

Condition:
	Expression
	{
		$$ = $1 //TODO 5
	}

ConstDecl11:
	/* EMPTY */
	{
		$$ = []ConstDecl11(nil) //TODO 6
	}
|	ConstDecl11 ConstSpec ';'
	{
		$$ = append($1.([]ConstDecl11), $2, ";") //TODO 7
	}

ConstSpec:
	IDENTIFIER_LIST
	{
		$$ = $1 //TODO 8
	}
|	IDENTIFIER_LIST '=' ExpressionList
	{
		$$ = []ConstSpec{$1, "=", $3} //TODO 9
	}
|	IDENTIFIER_LIST Type '=' ExpressionList
	{
		$$ = []ConstSpec{$1, $2, "=", $4} //TODO 10
	}

Declaration:
	CONST ConstSpec
	{
		$$ = []Declaration{"const", $2} //TODO 11
	}
|	CONST '(' ConstDecl11 ')'
	{
		$$ = []Declaration{"const", "(", $3, ")"} //TODO 12
	}
|	TYPE TypeSpec
	{
		$$ = []Declaration{"type", $2} //TODO 13
	}
|	TYPE '(' TypeDecl11 ')'
	{
		$$ = []Declaration{"type", "(", $3, ")"} //TODO 14
	}
|	VAR VarSpec
	{
		$$ = []Declaration{"var", $2} //TODO 15
	}
|	VAR '(' VarDecl11 ')'
	{
		$$ = []Declaration{"var", "(", $3, ")"} //TODO 16
	}

Element:
	Expression
	{
		$$ = $1 //TODO 17
	}
|	Expression ':' Expression
	{
		$$ = []Element{$1, ":", $3} //TODO 18
	}
|	LiteralValue
	{
		$$ = $1 //TODO 19
	}
|	Expression ':' LiteralValue
	{
		$$ = []Element{$1, ":", $3} //TODO 20
	}

ElementList1:
	/* EMPTY */
	{
		$$ = []ElementList1(nil) //TODO 21
	}
|	ElementList1 ',' Element
	{
		$$ = append($1.([]ElementList1), ",", $3) //TODO 22
	}

ElementType:
	Type
	{
		$$ = $1 //TODO 23
	}

ExprSwitchStmt2:
	/* EMPTY */
	{
		$$ = nil //TODO 24
	}
|	Expression
	{
		$$ = $1 //TODO 25
	}

ExprSwitchStmt3:
	/* EMPTY */
	{
		$$ = []ExprSwitchStmt3(nil) //TODO 26
	}
|	ExprSwitchStmt3 CASE ExpressionList ':' StatementList
	{
		$$ = append($1.([]ExprSwitchStmt3), "case", $3, ":", $5) //TODO 27
	}
|	ExprSwitchStmt3 DEFAULT ':' StatementList
	{
		$$ = append($1.([]ExprSwitchStmt3), "default", ":", $4) //TODO 28
	}

Expression:
	UnaryExpr
	{
		$$ = $1 //TODO 29
	}
|	Expression OROR Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 30
	}
|	Expression ANDAND Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 31
	}
|	Expression EQ Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 32
	}
|	Expression NE Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 33
	}
|	Expression '<' Expression
	{
		$$ = []Expression{$1, "<", $3} //TODO 34
	}
|	Expression LE Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 35
	}
|	Expression '>' Expression
	{
		$$ = []Expression{$1, ">", $3} //TODO 36
	}
|	Expression GE Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 37
	}
|	Expression '+' Expression
	{
		$$ = []Expression{$1, "+", $3} //TODO 38
	}
|	Expression '-' Expression
	{
		$$ = []Expression{$1, "-", $3} //TODO 39
	}
|	Expression '|' Expression
	{
		$$ = []Expression{$1, "|", $3} //TODO 40
	}
|	Expression '^' Expression
	{
		$$ = []Expression{$1, "^", $3} //TODO 41
	}
|	Expression '*' Expression
	{
		$$ = []Expression{$1, "*", $3} //TODO 42
	}
|	Expression '/' Expression
	{
		$$ = []Expression{$1, "/", $3} //TODO 43
	}
|	Expression '%' Expression
	{
		$$ = []Expression{$1, "%", $3} //TODO 44
	}
|	Expression LSH Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 45
	}
|	Expression RSH Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 46
	}
|	Expression '&' Expression
	{
		$$ = []Expression{$1, "&", $3} //TODO 47
	}
|	Expression ANDNOT Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 48
	}

ExpressionList:
	Expression ExpressionList1
	{
		$$ = []ExpressionList{$1, $2} //TODO 49
	}

ExpressionList1:
	/* EMPTY */
	{
		$$ = []ExpressionList1(nil) //TODO 50
	}
|	ExpressionList1 ',' Expression
	{
		$$ = append($1.([]ExpressionList1), ",", $3) //TODO 51
	}

FieldDecl2:
	/* EMPTY */
	{
		$$ = nil //TODO 52
	}
|	STRING_LIT
	{
		$$ = $1 //TODO 53
	}

Function:
	Signature Block
	{
		$$ = []Function{$1, $2} //TODO 54
	}

IfStmt:
	IF Expression LBR StatementList '}' IfStmt2
	{
		$$ = []IfStmt{"if", $2, $3, $4, "}", $6} //TODO 55
	}
|	IF SimpleStmt ';' Expression LBR StatementList '}' IfStmt2
	{
		$$ = []IfStmt{"if", $2, ";", $4, $5, $6, "}", $8} //TODO 56
	}

IfStmt2:
	/* EMPTY */
	{
		$$ = nil //TODO 57
	}
|	ELSE IfStmt
	{
		$$ = []IfStmt2{"else", $2} //TODO 58
	}
|	ELSE Block
	{
		$$ = []IfStmt2{"else", $2} //TODO 59
	}

ImportDecl11:
	/* EMPTY */
	{
		$$ = []ImportDecl11(nil) //TODO 60
	}
|	ImportDecl11 ImportSpec ';'
	{
		$$ = append($1.([]ImportDecl11), $2, ";") //TODO 61
	}

ImportSpec:
	STRING_LIT
	{
		$$ = $1 //TODO 62
	}
|	'.' STRING_LIT
	{
		$$ = []ImportSpec{".", $2} //TODO 63
	}
|	PackageName STRING_LIT
	{
		$$ = []ImportSpec{$1, $2} //TODO 64
	}

InterfaceType1:
	/* EMPTY */
	{
		$$ = []InterfaceType1(nil) //TODO 65
	}
|	InterfaceType1 MethodName Signature ';'
	{
		$$ = append($1.([]InterfaceType1), $2, $3, ";") //TODO 66
	}
|	InterfaceType1 Name ';'
	{
		$$ = append($1.([]InterfaceType1), $2, ";") //TODO 67
	}

Label:
	IDENTIFIER
	{
		$$ = $1 //TODO 68
	}

LiteralValue:
	'{' '}'
	{
		$$ = []LiteralValue{"{", "}"} //TODO 69
	}
|	'{' Element ElementList1 '}'
	{
		$$ = []LiteralValue{"{", $2, $3, "}"} //TODO 70
	}

MapType:
	MAP '[' Type ']' ElementType
	{
		$$ = []MapType{"map", "[", $3, "]", $5} //TODO 71
	}

MethodName:
	IDENTIFIER
	{
		$$ = $1 //TODO 72
	}

Name:
	IDENTIFIER %prec notDot
	{
		$$ = $1 //TODO 73
	}
|	IDENTIFIER '.' IDENTIFIER
	{
		$$ = []Name{$1, ".", $3} //TODO 74
	}

PackageName:
	IDENTIFIER
	{
		$$ = $1 //TODO 75
	}

ParameterDecl:
	ParameterDecl1 Type
	{
		$$ = []ParameterDecl{$1, $2} //TODO 76
	}
|	ParameterDecl1 DDD Type
	{
		$$ = []ParameterDecl{$1, $2, $3} //TODO 77
	}

ParameterDecl1:
	/* EMPTY */
	{
		$$ = nil //TODO 78
	}
|	IDENTIFIER_LIST
	{
		$$ = $1 //TODO 79
	}

ParameterList1:
	/* EMPTY */
	{
		$$ = []ParameterList1(nil) //TODO 80
	}
|	ParameterList1 ',' ParameterDecl
	{
		$$ = append($1.([]ParameterList1), ",", $3) //TODO 81
	}

Parameters:
	'(' ')'
	{
		$$ = []Parameters{"(", ")"} //TODO 82
	}
|	'(' ParameterDecl ParameterList1 ')'
	{
		$$ = []Parameters{"(", $2, $3, ")"} //TODO 83
	}

PrimaryExpr:
	INT_LIT
	{
		$$ = $1 //TODO 84
	}
|	FLOAT_LIT
	{
		$$ = $1 //TODO 85
	}
|	IMAGINARY_LIT
	{
		$$ = $1 //TODO 86
	}
|	RUNE_LIT
	{
		$$ = $1 //TODO 87
	}
|	STRING_LIT
	{
		$$ = $1 //TODO 88
	}
|	StructType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 89
	}
|	ArrayType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 90
	}
|	'[' DDD ']' ElementType LiteralValue
	{
		$$ = []PrimaryExpr{"[", $2, "]", $4, $5} //TODO 91
	}
|	SliceType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 92
	}
|	MapType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 93
	}
|	FUNC Function
	{
		$$ = []PrimaryExpr{"func", $2} //TODO 94
	}
|	Name
	{
		$$ = $1 //TODO 95
	}
|	Name LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 96
	}
|	'(' Expression ')'
	{
		$$ = []PrimaryExpr{"(", $2, ")"} //TODO 97
	}
|	PrimaryExpr '.' IDENTIFIER
	{
		$$ = []PrimaryExpr{$1, ".", $3} //TODO 98
	}
|	PrimaryExpr '[' Expression ']'
	{
		$$ = []PrimaryExpr{$1, "[", $3, "]"} //TODO 99
	}
|	PrimaryExpr '[' Slice1 ':' ']'
	{
		$$ = []PrimaryExpr{$1, "[", $3, ":", "]"} //TODO 100
	}
|	PrimaryExpr '[' Slice1 ':' Expression ']'
	{
		$$ = []PrimaryExpr{$1, "[", $3, ":", $5, "]"} //TODO 101
	}
|	PrimaryExpr '.' '(' Type ')'
	{
		$$ = []PrimaryExpr{$1, ".", "(", $4, ")"} //TODO 102
	}
|	PrimaryExpr '(' ')'
	{
		$$ = []PrimaryExpr{$1, "(", ")"} //TODO 103
	}
|	PrimaryExpr '(' ArgumentList ')'
	{
		$$ = []PrimaryExpr{$1, "(", $3, ")"} //TODO 104
	}
|	PrimaryExpr '(' TypeNoName ')'
	{
		$$ = []PrimaryExpr{$1, "(", $3, ")"} //TODO 105
	}
|	PrimaryExpr '(' TypeNoName ',' ArgumentList ')'
	{
		$$ = []PrimaryExpr{$1, "(", $3, ",", $5, ")"} //TODO 106
	}

Receiver:
	'(' IDENTIFIER ')'
	{
		$$ = []Receiver{"(", $2, ")"} //TODO 107
	}
|	'(' '*' IDENTIFIER ')'
	{
		$$ = []Receiver{"(", "*", $3, ")"} //TODO 108
	}
|	'(' IDENTIFIER IDENTIFIER ')'
	{
		$$ = []Receiver{"(", $2, $3, ")"} //TODO 109
	}
|	'(' IDENTIFIER '*' IDENTIFIER ')'
	{
		$$ = []Receiver{"(", $2, "*", $4, ")"} //TODO 110
	}

RecvExpr:
	Expression
	{
		$$ = $1 //TODO 111
	}

SelectStmt1:
	/* EMPTY */
	{
		$$ = []SelectStmt1(nil) //TODO 112
	}
|	SelectStmt1 CASE SendStmt ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, ":", $5) //TODO 113
	}
|	SelectStmt1 CASE RecvExpr ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, ":", $5) //TODO 114
	}
|	SelectStmt1 CASE ExpressionList '=' RecvExpr ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, "=", $5, ":", $7) //TODO 115
	}
|	SelectStmt1 CASE IDLIST_COLAS RecvExpr ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, $4, ":", $6) //TODO 116
	}
|	SelectStmt1 DEFAULT ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "default", ":", $4) //TODO 117
	}

SendStmt:
	Expression COMM Expression
	{
		$$ = []SendStmt{$1, $2, $3} //TODO 118
	}

Signature:
	Parameters
	{
		$$ = $1 //TODO 119
	}
|	Parameters Parameters
	{
		$$ = []Signature{$1, $2} //TODO 120
	}
|	Parameters Name
	{
		$$ = []Signature{$1, $2} //TODO 121
	}
|	Parameters TypeLit
	{
		$$ = []Signature{$1, $2} //TODO 122
	}

SimpleStmt:
	/* EMPTY */
	{
		$$ = nil //TODO 123
	}
|	Expression
	{
		$$ = $1 //TODO 124
	}
|	SendStmt
	{
		$$ = $1 //TODO 125
	}
|	Expression INC
	{
		$$ = []SimpleStmt{$1, $2} //TODO 126
	}
|	Expression DEC
	{
		$$ = []SimpleStmt{$1, $2} //TODO 127
	}
|	ExpressionList ASSIGN_OP ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 128
	}
|	IDLIST_COLAS ExpressionList
	{
		$$ = []SimpleStmt{$1, $2} //TODO 129
	}

Slice1:
	/* EMPTY */
	{
		$$ = nil //TODO 130
	}
|	Expression
	{
		$$ = $1 //TODO 131
	}

SliceType:
	'[' ']' ElementType
	{
		$$ = []SliceType{"[", "]", $3} //TODO 132
	}

SourceFile:
	PACKAGE PackageName ';' SourceFile1 SourceFile2
	{
		$$ = []SourceFile{"package", $2, ";", $4, $5} //TODO 133
	}

SourceFile1:
	/* EMPTY */
	{
		$$ = []SourceFile1(nil) //TODO 134
	}
|	SourceFile1 IMPORT ImportSpec ';'
	{
		$$ = append($1.([]SourceFile1), "import", $3, ";") //TODO 135
	}
|	SourceFile1 IMPORT '(' ImportDecl11 ')' ';'
	{
		$$ = append($1.([]SourceFile1), "import", "(", $4, ")", ";") //TODO 136
	}

SourceFile2:
	/* EMPTY */
	{
		$$ = []SourceFile2(nil) //TODO 137
	}
|	SourceFile2 Declaration ';'
	{
		$$ = append($1.([]SourceFile2), $2, ";") //TODO 138
	}
|	SourceFile2 FUNC IDENTIFIER Function ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, ";") //TODO 139
	}
|	SourceFile2 FUNC IDENTIFIER Signature ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, ";") //TODO 140
	}
|	SourceFile2 FUNC Receiver MethodName Function ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, $5, ";") //TODO 141
	}
|	SourceFile2 FUNC Receiver MethodName Signature ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, $5, ";") //TODO 142
	}

Start:
	SourceFile
	{
		_parserResult = $1 //TODO 143
	}

Statement:
	Declaration
	{
		$$ = $1 //TODO 144
	}
|	Label ':' Statement
	{
		$$ = []Statement{$1, ":", $3} //TODO 145
	}
|	SimpleStmt
	{
		$$ = $1 //TODO 146
	}
|	GO Expression
	{
		$$ = []Statement{"go", $2} //TODO 147
	}
|	RETURN
	{
		$$ = "return" //TODO 148
	}
|	RETURN ExpressionList
	{
		$$ = []Statement{"return", $2} //TODO 149
	}
|	BREAK
	{
		$$ = "break" //TODO 150
	}
|	BREAK Label
	{
		$$ = []Statement{"break", $2} //TODO 151
	}
|	CONTINUE
	{
		$$ = "continue" //TODO 152
	}
|	CONTINUE Label
	{
		$$ = []Statement{"continue", $2} //TODO 153
	}
|	GOTO Label
	{
		$$ = []Statement{"goto", $2} //TODO 154
	}
|	FALLTHROUGH
	{
		$$ = "fallthrough" //TODO 155
	}
|	Block
	{
		$$ = $1 //TODO 156
	}
|	IfStmt
	{
		$$ = $1 //TODO 157
	}
|	SWITCH ExprSwitchStmt2 LBR ExprSwitchStmt3 '}'
	{
		$$ = []Statement{"switch", $2, $3, $4, "}"} //TODO 158
	}
|	SWITCH SimpleStmt ';' ExprSwitchStmt2 LBR ExprSwitchStmt3 '}'
	{
		$$ = []Statement{"switch", $2, ";", $4, $5, $6, "}"} //TODO 159
	}
|	SWITCH PrimaryExpr '.' '(' TYPE ')' LBR TypeSwitchStmt2 '}'
	{
		$$ = []Statement{"switch", $2, ".", "(", "type", ")", $7, $8, "}"} //TODO 160
	}
|	SWITCH SimpleStmt ';' PrimaryExpr '.' '(' TYPE ')' LBR TypeSwitchStmt2 '}'
	{
		$$ = []Statement{"switch", $2, ";", $4, ".", "(", "type", ")", $9, $10, "}"} //TODO 161
	}
|	SWITCH IDLIST_COLAS PrimaryExpr '.' '(' TYPE ')' LBR TypeSwitchStmt2 '}'
	{
		$$ = []Statement{"switch", $2, $3, ".", "(", "type", ")", $8, $9, "}"} //TODO 162
	}
|	SWITCH SimpleStmt ';' IDLIST_COLAS PrimaryExpr '.' '(' TYPE ')' LBR TypeSwitchStmt2 '}'
	{
		$$ = []Statement{"switch", $2, ";", $4, $5, ".", "(", "type", ")", $10, $11, "}"} //TODO 163
	}
|	SELECT '{' SelectStmt1 '}'
	{
		$$ = []Statement{"select", "{", $3, "}"} //TODO 164
	}
|	FOR LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, $3, "}"} //TODO 165
	}
|	FOR Condition LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, $3, $4, "}"} //TODO 166
	}
|	FOR SimpleStmt ';' ';' SimpleStmt LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, ";", ";", $5, $6, $7, "}"} //TODO 167
	}
|	FOR SimpleStmt ';' Condition ';' SimpleStmt LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, ";", $4, ";", $6, $7, $8, "}"} //TODO 168
	}
|	FOR ExpressionList '=' RANGE Expression LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, "=", "range", $5, $6, $7, "}"} //TODO 169
	}
|	FOR IDLIST_COLAS RANGE Expression LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, "range", $4, $5, $6, "}"} //TODO 170
	}
|	DEFER Expression
	{
		$$ = []Statement{"defer", $2} //TODO 171
	}

StatementList:
	StatementList1
	{
		$$ = $1 //TODO 172
	}

StatementList1:
	/* EMPTY */
	{
		$$ = []StatementList1(nil) //TODO 173
	}
|	StatementList1 Statement ';'
	{
		$$ = append($1.([]StatementList1), $2, ";") //TODO 174
	}

StructType:
	STRUCT '{' StructType1 '}'
	{
		$$ = []StructType{"struct", "{", $3, "}"} //TODO 175
	}

StructType1:
	/* EMPTY */
	{
		$$ = []StructType1(nil) //TODO 176
	}
|	StructType1 IDENTIFIER_LIST Type FieldDecl2 ';'
	{
		$$ = append($1.([]StructType1), $2, $3, $4, ";") //TODO 177
	}
|	StructType1 Name FieldDecl2 ';'
	{
		$$ = append($1.([]StructType1), $2, $3, ";") //TODO 178
	}
|	StructType1 '*' Name FieldDecl2 ';'
	{
		$$ = append($1.([]StructType1), "*", $3, $4, ";") //TODO 179
	}

Type:
	Name
	{
		$$ = $1 //TODO 180
	}
|	TypeLit
	{
		$$ = $1 //TODO 181
	}
|	'(' Type ')'
	{
		$$ = []Type{"(", $2, ")"} //TODO 182
	}

TypeDecl11:
	/* EMPTY */
	{
		$$ = []TypeDecl11(nil) //TODO 183
	}
|	TypeDecl11 TypeSpec ';'
	{
		$$ = append($1.([]TypeDecl11), $2, ";") //TODO 184
	}

TypeList1:
	/* EMPTY */
	{
		$$ = []TypeList1(nil) //TODO 185
	}
|	TypeList1 ',' Type
	{
		$$ = append($1.([]TypeList1), ",", $3) //TODO 186
	}

TypeLit:
	ArrayType
	{
		$$ = $1 //TODO 187
	}
|	StructType
	{
		$$ = $1 //TODO 188
	}
|	'*' TypeNoName
	{
		$$ = []TypeLit{"*", $2} //TODO 189
	}
|	FUNC Signature
	{
		$$ = []TypeLit{"func", $2} //TODO 190
	}
|	INTERFACE '{' InterfaceType1 '}'
	{
		$$ = []TypeLit{"interface", "{", $3, "}"} //TODO 191
	}
|	SliceType
	{
		$$ = $1 //TODO 192
	}
|	MapType
	{
		$$ = $1 //TODO 193
	}
|	CHAN ElementType
	{
		$$ = []TypeLit{"chan", $2} //TODO 194
	}
|	CHANCOMM ElementType
	{
		$$ = []TypeLit{$1, $2} //TODO 195
	}
|	COMMCHAN ElementType
	{
		$$ = []TypeLit{$1, $2} //TODO 196
	}

TypeNoName:
	TypeLit
	{
		$$ = $1 //TODO 197
	}
|	'(' TypeNoName ')'
	{
		$$ = []TypeNoName{"(", $2, ")"} //TODO 198
	}

TypeSpec:
	IDENTIFIER Type
	{
		$$ = []TypeSpec{$1, $2} //TODO 199
	}

TypeSwitchStmt2:
	/* EMPTY */
	{
		$$ = []TypeSwitchStmt2(nil) //TODO 200
	}
|	TypeSwitchStmt2 CASE Type TypeList1 ':' StatementList
	{
		$$ = append($1.([]TypeSwitchStmt2), "case", $3, $4, ":", $6) //TODO 201
	}
|	TypeSwitchStmt2 DEFAULT ':' StatementList
	{
		$$ = append($1.([]TypeSwitchStmt2), "default", ":", $4) //TODO 202
	}

UnaryExpr:
	PrimaryExpr
	{
		$$ = $1 //TODO 203
	}
|	'+' UnaryExpr
	{
		$$ = []UnaryExpr{"+", $2} //TODO 204
	}
|	'-' UnaryExpr
	{
		$$ = []UnaryExpr{"-", $2} //TODO 205
	}
|	'!' UnaryExpr
	{
		$$ = []UnaryExpr{"!", $2} //TODO 206
	}
|	'^' UnaryExpr
	{
		$$ = []UnaryExpr{"^", $2} //TODO 207
	}
|	'*' UnaryExpr
	{
		$$ = []UnaryExpr{"*", $2} //TODO 208
	}
|	'&' UnaryExpr
	{
		$$ = []UnaryExpr{"&", $2} //TODO 209
	}
|	COMM UnaryExpr
	{
		$$ = []UnaryExpr{$1, $2} //TODO 210
	}

VarDecl11:
	/* EMPTY */
	{
		$$ = []VarDecl11(nil) //TODO 211
	}
|	VarDecl11 VarSpec ';'
	{
		$$ = append($1.([]VarDecl11), $2, ";") //TODO 212
	}

VarSpec:
	IDENTIFIER_LIST Type
	{
		$$ = []VarSpec{$1, $2} //TODO 213
	}
|	IDENTIFIER_LIST Type '=' ExpressionList
	{
		$$ = []VarSpec{$1, $2, "=", $4} //TODO 214
	}
|	IDENTIFIER_LIST '=' ExpressionList
	{
		$$ = []VarSpec{$1, "=", $3} //TODO 215
	}

%%

//TODO remove demo stuff below

var _parserResult interface{}

type (
	ArgumentList interface{}
	ArrayType interface{}
	Block interface{}
	Condition interface{}
	ConstDecl11 interface{}
	ConstSpec interface{}
	Declaration interface{}
	Element interface{}
	ElementList1 interface{}
	ElementType interface{}
	ExprSwitchStmt2 interface{}
	ExprSwitchStmt3 interface{}
	Expression interface{}
	ExpressionList interface{}
	ExpressionList1 interface{}
	FieldDecl2 interface{}
	Function interface{}
	IfStmt interface{}
	IfStmt2 interface{}
	ImportDecl11 interface{}
	ImportSpec interface{}
	InterfaceType1 interface{}
	Label interface{}
	LiteralValue interface{}
	MapType interface{}
	MethodName interface{}
	Name interface{}
	PackageName interface{}
	ParameterDecl interface{}
	ParameterDecl1 interface{}
	ParameterList1 interface{}
	Parameters interface{}
	PrimaryExpr interface{}
	Receiver interface{}
	RecvExpr interface{}
	SelectStmt1 interface{}
	SendStmt interface{}
	Signature interface{}
	SimpleStmt interface{}
	Slice1 interface{}
	SliceType interface{}
	SourceFile interface{}
	SourceFile1 interface{}
	SourceFile2 interface{}
	Start interface{}
	Statement interface{}
	StatementList interface{}
	StatementList1 interface{}
	StructType interface{}
	StructType1 interface{}
	Type interface{}
	TypeDecl11 interface{}
	TypeList1 interface{}
	TypeLit interface{}
	TypeNoName interface{}
	TypeSpec interface{}
	TypeSwitchStmt2 interface{}
	UnaryExpr interface{}
	VarDecl11 interface{}
	VarSpec interface{}
)
	
func _dump() {
	s := fmt.Sprintf("%#v", _parserResult)
	s = strings.Replace(s, "%", "%%", -1)
	s = strings.Replace(s, "{", "{%i\n", -1)
	s = strings.Replace(s, "}", "%u\n}", -1)
	s = strings.Replace(s, ", ", ",\n", -1)
	var buf bytes.Buffer
	strutil.IndentFormatter(&buf, ". ").Format(s)
	buf.WriteString("\n")
	a := strings.Split(buf.String(), "\n")
	for _, v := range a {
		if strings.HasSuffix(v, "(nil)") || strings.HasSuffix(v, "(nil),") {
			continue
		}
	
		fmt.Println(v)
	}
}

// End of demo stuff
