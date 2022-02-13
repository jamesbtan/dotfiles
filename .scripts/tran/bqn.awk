#!/usr/bin/awk -f
function rep_or_d(t, w, d) {
	if (!(w in t))
		return d
	return t[w]
}
BEGIN {
	# + Conjugate     | Add
	# - Negate        | Subtract
	# | AbsoluteValue | Modulus
	# < Enclose       | LessThan
	# > Merge         | GreaterThan
	# = Rank          | Equal
	# / Indices       | Replicate
	# ! Assert        | AssertMsg
	# ` _scan
	# @ constant null character
	# # COMMENT
	tr["="]  = "×" # × Sign         | Multiply
	tr["-"]  = "÷" # ÷ Recipical    | Divide
	tr["+"]  = "⋆" # ⋆ Exponential  | Power
	tr["_"]  = "√" # √ Square root  | Root
	tr["b"]  = "⌊" # ⌊ Floor        | Minimum
	tr["B"]  = "⌈" # ⌈ Ceiling      | Maximum
	tr["t"]  = "∧" # ∧ SortUp       | And
	tr["v"]  = "∨" # ∨ SortDown     | Or
	tr["~"]  = "¬" # ¬ Not          | Span
	tr["<"]  = "≤" # ≤              | LessOrEqual
	tr[">"]  = "≥" # ≥              | GreaterOrEqual
	tr["/"]  = "≠" # ≠ Length       | NotEqual
	tr["m"]  = "≡" # ≡ Depth        | Match
	tr["M"]  = "≢" # ≢ Shape        | NotMatch
	tr["{"]  = "⊣" # ⊣ Identity     | Left
	tr["}"]  = "⊢" # ⊢ Identity     | Right
	tr["z"]  = "⥊" # ⥊ Deshape      | Reshape
	tr[","]  = "∾" # ∾ Join         | JoinTo
	tr["."]  = "≍" # ≍ Solo         | Couple
	tr["Z"]  = "⋈" # ⋈ Enclose      | Pair
	tr["r"]  = "↑" # ↑ Prefixes     | Take
	tr["c"]  = "↓" # ↓ Suffixes     | Drop
	tr["d"]  = "↕" # ↕ Range        | Windows
	tr["H"]  = "«" # « ShiftBefore  | ReplaceEnd
	tr["L"]  = "»" # » ShiftAfter   | ReplaceStart
	tr["q"]  = "⌽" # ⌽ Reverse      | Rotate
	tr["a"]  = "⍉" # ⍉ Transpose    | ReorderAxis
	tr["T"]  = "⍋" # ⍋ GradeUp      | BinsUp
	tr["V"]  = "⍒" # ⍒ GradeDown    | BinsDown
	tr["i"]  = "⊏" # ⊏ FirstCell    | Select
	tr["I"]  = "⊑" # ⊑ First        | Pick
	tr["o"]  = "⊐" # ⊐ Classify     | IndexOf
	tr["O"]  = "⊒" # ⊒ VisitCount   | AdvanceIndexOf
	tr["e"]  = "∊" # ∊ MarkFirst    | MemberOf
	tr["E"]  = "⍷" # ⍷ Deduplicate  | Find
	tr["u"]  = "⊔" # ⊔ GroupIndices | Group
	tr["\""] = "˙" # ˙ _constant
	tr["`"]  = "˜" # ˜ _self        | _swap
	tr["1"]  = "˘" # ˘ _cells
	tr["2"]  = "¨" # ¨ _each
	tr["3"]  = "⁼" # ⁼ _undo
	tr["4"]  = "⌜" # ⌜ _table
	tr["5"]  = "´" # ´ _fold
	tr["6"]  = "˝" # ˝ _insert
	tr["j"]  = "∘" # ∘ _atop_
	tr["k"]  = "○" # ○ _over_
	tr["h"]  = "⊸" # ⊸ _bind_before_
	tr["l"]  = "⟜" # ⟜ _bind_after_
	tr["K"]  = "⌾" # ⌾ _under_
	tr["%"]  = "⊘" # ⊘ _valences_
	tr["$"]  = "◶" # ◶ _choose_
	tr["^"]  = "⎊" # ⎊ _catch_
	tr["!"]  = "⎉" # ⎉ _rank_
	tr["@"]  = "⚇" # ⚇ _depth_
	tr["#"]  = "⍟" # ⍟ _repeat_
	tr["["]  = "←" # ← DEFINE
	tr["?"]  = "⇐" # ⇐ EXPORT
	tr["'"]  = "↩" # ↩ CHANGE
	tr[";"]  = "⋄" # ⋄ SEPERATOR
	tr["("]  = "⟨" # ⟨ BEGIN LIST
	tr[")"]  = "⟩" # ⟩ END LIST
	tr[" "]  = "‿" # ‿ STRAND
	tr[":"]  = "·" # · NOTHING
	tr["0"]  = "•" # • SYSTEM
	tr["w"]  = "𝕨" # 𝕨 left argument
	tr["W"]  = "𝕎" # 𝕎 left argument function
	tr["x"]  = "𝕩" # 𝕩 right argument
	tr["X"]  = "𝕏" # 𝕏 right argument function
	tr["f"]  = "𝕗" # 𝕗 left operand
	tr["F"]  = "𝔽" # 𝔽 left operand function
	tr["g"]  = "𝕘" # 𝕘 right operand
	tr["G"]  = "𝔾" # 𝔾 right operand function
	tr["s"]  = "𝕤" # 𝕤 self
	tr["S"]  = "𝕊" # 𝕊 self function
	tr["R"]  = "𝕣" # 𝕣 self modifier
	tr["9"]  = "¯" # ¯ minus
	tr["p"]  = "π" # π constant pi
	tr["8"]  = "∞" # ∞ constant infinity
	tr["\\"] = "\\"

	RS = "(.)"
	s = 0
}

1 {
	if (s) {
		printf "%s", rep_or_d(tr, RT, RT)
		s = 0
	} else if (RT == "\\") {
		s = 1
	} else {
		printf "%s", RT
	}
}
