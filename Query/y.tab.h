/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     GRAPH = 258,
     DIRECTEDGRAPH = 259,
     UNDIRECTEDGRAPH = 260,
     VERTEX = 261,
     EDGE = 262,
     QUERY = 263,
     QUERYINGFOREQUAL = 264,
     QUERYSTART = 265,
     INCLUDE = 266,
     STARTWITH = 267,
     ENDWITH = 268,
     SUBSTRING = 269,
     PREDICATE = 270,
     EDGESTART = 271,
     EDGEFINISH = 272,
     PLUS = 273,
     MINUS = 274,
     DIV = 275,
     STAR = 276,
     DOT = 277,
     COMMA = 278,
     NOT = 279,
     QUESTION = 280,
     OR = 281,
     MAP = 282,
     LIST = 283,
     SET = 284,
     LESSTHAN = 285,
     LESSTHANEQUAL = 286,
     GREATERTHAN = 287,
     GREATERTHANEQUAL = 288,
     LEFTPARAM = 289,
     RIGHTPARAM = 290,
     LEFTBRACKET = 291,
     RIGHTBRACKET = 292,
     LEFTBRACE = 293,
     RIGHTBRACE = 294,
     INT = 295,
     ASSIGN = 296,
     ID = 297,
     ASSOCIATE = 298,
     FLOAT = 299,
     STRING = 300,
     DIRECTEDLINE = 301,
     UNDIRECTEDLINE = 302
   };
#endif
/* Tokens.  */
#define GRAPH 258
#define DIRECTEDGRAPH 259
#define UNDIRECTEDGRAPH 260
#define VERTEX 261
#define EDGE 262
#define QUERY 263
#define QUERYINGFOREQUAL 264
#define QUERYSTART 265
#define INCLUDE 266
#define STARTWITH 267
#define ENDWITH 268
#define SUBSTRING 269
#define PREDICATE 270
#define EDGESTART 271
#define EDGEFINISH 272
#define PLUS 273
#define MINUS 274
#define DIV 275
#define STAR 276
#define DOT 277
#define COMMA 278
#define NOT 279
#define QUESTION 280
#define OR 281
#define MAP 282
#define LIST 283
#define SET 284
#define LESSTHAN 285
#define LESSTHANEQUAL 286
#define GREATERTHAN 287
#define GREATERTHANEQUAL 288
#define LEFTPARAM 289
#define RIGHTPARAM 290
#define LEFTBRACKET 291
#define RIGHTBRACKET 292
#define LEFTBRACE 293
#define RIGHTBRACE 294
#define INT 295
#define ASSIGN 296
#define ID 297
#define ASSOCIATE 298
#define FLOAT 299
#define STRING 300
#define DIRECTEDLINE 301
#define UNDIRECTEDLINE 302




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

