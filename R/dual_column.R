## A handy function for creating dual column slides in both html and powerpoint
dual_column <- function (left.is.text=TRUE, left, right, img) {
  working_dir <- getwd()
  if (knitr::is_html_output()) {
    cat(knitr::knit_child(system.file('extrmdfiles', 'dual-column-html.Rmd', package = 'columnizeR'),
                          options=list (content.type=left.is.text,
                                        left_content_path=left,
                                        right_content_path=right,
                                        img_content_path=img,
                                        wd=working_dir),
                          quiet=TRUE),
        sep = "\n")
  } else {
    cat(knitr::knit_child(system.file('extrmdfiles', 'dual-column-pp-latex.Rmd', package = 'columnizeR'),
                          options=list (content.type=left.is.text,
                                        left_content_path=left,
                                        right_content_path=right,
                                        img_content_path=img,
                                        wd=working_dir),
                          quiet=TRUE))
  }
}
