;; extends
[ "chan" "map" ] @Keyword

((type_identifier) @variable
 (#any-of? @variable
  "any"
  "comparable"
  ))

;; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/go/highlights.scm
