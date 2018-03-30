if exists("b:current_syntax")
	finish
endif

syntax keyword potionKeyword loop while to times
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string

syntax match potionComment "\v#.*$"

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v\="

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link potionString String

highlight link potionOperator Operator

highlight link potionComment Comment
highlight link potionFunction Function
highlight link potionKeyword Keyword

let b:current_syntax = "potion"
