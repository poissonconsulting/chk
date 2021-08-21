chk_reg_exp <- function() {
  "^\\s*(chk\\s*::\\s*)?chk_[[:alpha:]](\\w|\\.)*\\s*\\(.*"
}

not_chk_reg_exp <- function() {
  "^\\s*#\\s*!\\s*chk\\s"
}

comment_chks <- function(lines) {
  chk_vector(lines)
  chk_character(lines)
  chk_not_any_na(lines)

  if(!length(lines)) return(lines)
  paste0("# !chk ", lines[grepl(chk_reg_exp(), lines)])
}

uncomment_chks <- function(lines) {
  chk_vector(lines)
  chk_character(lines)
  chk_not_any_na(lines)

  if(!length(lines)) return(lines)
  sub(not_chk_reg_exp(), "", lines)
}
