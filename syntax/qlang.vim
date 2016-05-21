" Vim syntax file
" Language: qlang            (https://github.com/qiniu/qlang)
" Maintainer: Simon Xia        (simonxia.OMG@gmail.com)
" Latest Revision: 22 May 2016

if exists("b:current_syntax")
  finish
endif

syn keyword     qDirective          include import
syn keyword     qSignedInts         int int8 int16 int32 int64
syn keyword     qUnsignedInts       byte uint uint8 uint16 uint32 uint64
syn keyword     qType               float string bool var slice map chan class fn
syn keyword     qBoolean            true false nil iota undefined
syn keyword     qDeclaration        const
syn match       qBuiltins           /\<\v(append|cap|close|complex|copy|delete|imag|len)\ze\(/
syn match       qBuiltins           /\<\v(make|panic|print|println|real|recover)\ze\(/
syn match       qBuiltins           /\<\v(mkmap|mapFrom|set|get|mkslice|sliceFrom|sliceOf|mkchan|sub|type|min|max|_init|mapOf)\ze\(/
syn keyword     qBuiltins           new this main

hi def link     qDirective          Statement
hi def link     qSignedInts         Type
hi def link     qUnsignedInts       Type
hi def link     qType               Type
hi def link     qBoolean            Boolean
hi def link     qBuiltins           Keyword
hi def link     qDeclaration        Keyword

syn keyword     qStatement          defer go goto return break continue fallthrough export
syn keyword     qConditional        if elif else switch select
syn keyword     qLabel              case default
syn keyword     qRepeat             for range

hi def link     qStatement          Statement
hi def link     qConditional        Conditional
hi def link     qLabel              Label
hi def link     qRepeat             Repeat

syn region      qComment            start="/\*" end="\*/" 
syn region      qComment            start="//" end="$" 
hi def link     qComment            Comment

syn match       qEscapeOctal        display contained "\\[0-7]\{3}"
syn match       qEscapeC            display contained +\\[abfnrtv\\'"]+
syn match       qEscapeX            display contained "\\x\x\{2}"
syn match       qEscapeU            display contained "\\u\x\{4}"
syn match       qEscapeBigU         display contained "\\U\x\{8}"
syn match       qEscapeError        display contained +\\[^0-7xuUabfnrtv\\'"]+
hi def link     qEscapeOctal        qSpecialString
hi def link     qEscapeC            qSpecialString
hi def link     qEscapeX            qSpecialString
hi def link     qEscapeU            qSpecialString
hi def link     qEscapeBigU         qSpecialString
hi def link     qSpecialString      Special
hi def link     qEscapeError        Error

syn cluster     qStringGroup        contains=qEscapeOctal,qEscapeC,qEscapeX,qEscapeU,qEscapeBigU,qEscapeError
syn region      qString             start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@qStringGroup
syn region      qRawString          start=+`+ end=+`+
syn match       qFormatSpecifier    /%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)*[vTtbcdoqxXUeEfgGsp]/ contained containedin=qString
hi def link     qString             String
hi def link     qRawString          String
hi def link     qFormatSpecifier    qSpecialString

syn match       qDecimalInt         "\<-\=\d\+\%([Ee][-+]\=\d\+\)\=\>"
syn match       qHexadecimalInt     "\<-\=0[xX]\x\+\>"
syn match       qOctalInt           "\<-\=0\o\+\>"
syn match       qOctalError         "\<-\=0\o*[89]\d*\>"
hi def link     qDecimalInt         Integer
hi def link     qHexadecimalInt     Integer
hi def link     qOctalInt           Integer
hi def link     qOctalError         Error
hi def link     Integer             Number

syn match       qFloat              "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match       qFloat              "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"
hi def link     qFloat              Float

syn match      qFunction            /\(fn\s\+\)\@<=\w\+\((\)\@=/
syn match      qFunction            /\()\s\+\)\@<=\w\+\((\)\@=/
hi def link    qFunction            Function

syn match      qMethod              /\(\.\)\@<=\w\+\((\)\@=/
hi def link    qMethod              Type

syn region     qBlock               start="{" end="}" transparent fold
syn region     qParen               start='(' end=')' transparent
