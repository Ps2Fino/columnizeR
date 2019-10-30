#' Render two input Rmd files as equal width columns.
#'
#' Note this function is rather limited: it is expected for use inside R chunks with the results='asis' and warning=FALSE options specified.
#'
#' @param left.is.text True if the content of the left file is text only.
#' @param left The path to the local Rmd file for the left column.
#' @param right The path to the local Rmd file for the right column.
#' @param img path to the local image file to insert into the right column.
#' @param working_dir The working directory to base relative paths from
#' @return Dual column markdown correctly rendered using knitr irrespective of the output format.
#' @examples
#' dual_column (left='left-file.Rmd', right='right-file.Rmd', img='image-file.jpg', working_dir='./')
#' dual_column (left.is.text=FALSE, left='left-file.Rmd', right='right-file.Rmd', img='image-file.jpg')
dual_column <- function (left.is.text=TRUE, left, right, img, working_dir=getwd()) {
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
