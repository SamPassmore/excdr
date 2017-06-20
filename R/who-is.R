#' Who is excd?
#'
#' This function takes you to excd.org to let you explore all the great research they are doing!
#' @keywords excd
#' @export
#' @examples
#' excdr::who_are()

who_are <- function(){
  os = .Platform$OS.type
  if(os == "unix")
    system("open http://www.excd.org")
  else
    system("start http://www.excd.org")
}
