%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
    int yylineno;
    #define YYDEBUG 0
    %}

%token GRAPH DIRECTEDGRAPH UNDIRECTEDGRAPH VERTEX EDGE QUERY QUERYINGFOREQUAL QUERYSTART INCLUDE STARTWITH ENDWITH SUBSTRING PREDICATE EDGESTART EDGEFINISH PLUS MINUS DIV STAR DOT COMMA NOT QUESTION OR
%token MAP LIST SET LESSTHAN LESSTHANEQUAL GREATERTHAN GREATERTHANEQUAL LEFTPARAM RIGHTPARAM LEFTBRACKET RIGHTBRACKET LEFTBRACE RIGHTBRACE INT
%token ASSIGN ID ASSOCIATE
%token FLOAT STRING
%token DIRECTEDLINE UNDIRECTEDLINE

%%

prog: expr;

expr:var_def expr
    | LIST_def
    | MAP_def
    | SET_def
    | v_def
    | v_assign
    | de_def
    | ue_def
    | graph_def
    |
;
var_def:
ID ASSIGN var_type op
;
var_type:
ID
| INT
| FLOAT
;
op:
PLUS var_type op
| MINUS var_type op
| STAR var_type op
| DIV var_type op
| DIV {yyerror("Missing ID after div.");}
| STAR {yyerror("Missing ID after mult.");}
| MINUS {yyerror("Missing ID 
|
;
//
MAP_def:
MAP ID ASSIGN MAP_body
;
MAP_body:
LEFTBRACE pair RIGHTBRACE
;
pair:
LEFTPARAM ID ASSOCIATE value RIGHTPARAM pair_tail
;
pair_tail:
COMMA pair
|
;

value:
MAP_body
| LIST_body
| SET
| INT
| ID
| FLOAT
;
//
LIST_def:
LIST ID ASSIGN LIST_body
;

LIST_body:
LEFTBRACKET item RIGHTBRACKET
;
//
SET_def:
SET ID ASSIGN SET_body
;
SET_body:
LEFTPARAM item RIGHTPARAM
;
//
item:
p_value item_tail
;

item_tail:
COMMA item
|
;

p_value:
INT
| ID
| FLOAT
;
//
v_def:
VERTEX ID ASSIGN MAP_body
|VERTEX ID v_tail
;

v_tail:
COMMA ID v_tail
|
;

v_assign:
ID ASSIGN MAP_body
;
//
de_def:
EDGE ID DIRECTEDLINE ID MAP_body
;
//
ue_def:
EDGE ID UNDIRECTEDLINE ID MAP_body
;
//
graph_def:
DIRECTEDGRAPH ID dg_body
|DIRECTEDGRAPH {yyerror("Dırected graph format error.");}
|DIRECTEDGRAPH ID ug_body {yyerror("Dırected graph has undirected body type.");}
|UNDIRECTEDGRAPH ID ug_body
|UNDIRECTEDGRAPH {yyerror("Undirected graph format error.");}
|UNDIRECTEDGRAPH ID dg_body {yyerror("Undirected graph has directed body type.");}
;
//
dg_body:
LEFTBRACE v_def v_assign dg_body_tail
|LEFTBRACE v_def dg_body_tail
;
dg_body_tail:
v_def v_assign de_def dg_body_tail
|v_def de_def dg_body_tail
|dg_body_tail_tail
;
dg_body_tail_tail:
v_def v_assign dg_body_tail_tail
|v_def dg_body_tail_tail
| RIGHTBRACE
| {yyerror("Error definition without right brace.");}
;
//
ug_body:
LEFTBRACE v_def v_assign ug_body_tail
|LEFTBRACE v_def ug_body_tail
;
ug_body_tail:
v_def v_assign ue_def ug_body_tail
|v_def ue_def ug_body_tail
|ug_body_tail_tail
;
ug_body_tail_tail:
v_def v_assign ug_body_tail_tail
|v_def ug_body_tail_tail
|RIGHTBRACE
;
//
%%

void yyerror(char *s){
    fprintf(stderr, "%d: Near line %d = %s\n", yynerrs, yylineno, s);
}

int main(void){
    #if YYDEBUG
    yydebug = 1;
    #endif
    
    yyparse();
    
    if(yynerrs < 1){
        printf("Parsing is successful\n");
    }
    return 0;
}

