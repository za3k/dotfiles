" Vim syntax file
" Language: GTD system
" Maintainer: Zachary Vance
" Latest Revision: Mon Dev 03, 2012

if exists("b:current_syntax")
  finish
endif

" Keywords
syn region gtdTask start='"' end='"' contained nextgroup=gtdInOrderTo,gtdContext,gtdStatus skipwhite
syn region gtdGoal start='"' end='"' contained nextgroup=gtdInOrderTo,gtdStatus skipwhite
syn region gtdContext start='"' end='"' contained nextgroup=gtdInOrderTo,gtdStatus skipwhite
syn region gtdNote start='"' end='"' contained
syn region gtdStatus start='\[' end=']' contained
syn region gtdStatus start='"\[' end=']"' contained
syn keyword gtdDoKeyword Do nextgroup=gtdTask,gtdStatus skipwhite
syn keyword gtdNoteKeyword Note nextgroup=gtdNote skipwhite
syn keyword gtdInOrderTo in order to nextgroup=gtdInOrderTo,gtdGoal skipwhite contained

let b:current_syntax = "gtd"
hi def link gtdDoKeyword        Statement
hi def link gtdInOrderTo        Statement
hi def link gtdNoteKeyword      Statement
hi def link gtdTask             Identifier
hi def link gtdGoal             Identifier
hi def link gtdContext          Constant
hi def link gtdStatus           Constant
hi def link gtdNote             Comment
