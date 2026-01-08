Extension { #name : 'WATagBrush' }

{ #category : '*RenoirSt-Seaside' }
WATagBrush >> setStyleTo: aDeclarationAction [

	| declarationBlock |

	declarationBlock := CssDeclarationBlock new.
	aDeclarationAction cull: declarationBlock.
	self style: declarationBlock
]
