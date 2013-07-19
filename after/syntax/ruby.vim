if exists('g:no_ruby_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endi

syn match rubyNiceOperator "->"  conceal cchar=λ

syn match rubyFatRightArrowHead contained ">" conceal cchar= 
syn match rubyFatRightArrowTail contained "=" conceal cchar=⟹
syn match rubyNiceOperator "=>" contains=rubyFatRightArrowHead,rubyFatRightArrowTail

syn match rubyNiceOperator "!=" conceal cchar=≠
syn match rubyNiceOperator "==" conceal cchar=≣
syn match rubyNiceOperator "<=" conceal cchar=≦
syn match rubyNiceOperator ">=" conceal cchar=≧
syn match rubyNiceOperator "=\~" conceal cchar=≅
syn match rubyNiceOperator "!\~" conceal cchar=≇

syn cluster rubyNiceOperatorPart contains=rubyFatRightArrowHead,rubyFatRightArrowTail

hi! link Conceal Operator
hi link rubyNiceOperator Operator

setlocal conceallevel=2

