#' Writing BayesTraits files
#'
#' Given a data.frame and either a single object of class phylo or a list of class phylo objects, this function will subset the data on specified variables and prune the trees to match that data (optionally removing NA values) and write the data into a format suitable for use with BayesTraits.
#' @keywords excd, BayesTraits, phylogeny
#' @param tree an object of class phylo or list of phylo objects
#' @param data a data.frame
#' @param variables a character string or character vector of the names of columns to subset to, alternatively you can use the numeric values to indicate the column
#' @param dir the directory to save the output files to. Defaults to current directory
#' @param na.omit a TRUE/FALSE argument to specify whether NA values should be removed from your final data file
#' @param optional: used to name the output file. Will use variable names by default.
#' @return two files will be saved to the specified directory *.bttrees holding the pruned tree files and *.btdata holding the subset and formatted data.
#' @export

write.bayestraits <- function(tree, data, variables, dir = "./", na.omit = FALSE, filename){
  # Establish a new 'ArgCheck' object
  #Check <- ArgumentCheck::newArgCheck()
  # subset data to necessary variables keeping rownames
  data = data[,variables, drop = FALSE]

  # remove nas if necessary
  if(na.omit){
    data = data[complete.cases(data), , drop = FALSE]
  } else {
    data[is.na(data)] = "-"
  } # else replace NAs with hyphens

  # prune tree to match rownames in the data
  # for single tree
  if(class(tree) == 'phylo'){
    td = geiger::treedata(phy = tree, data = data, warnings = TRUE)
    tree = td$phy
    data = td$data
  } else if(all(unlist(lapply(tree, class)) == 'phylo')){ # for list of trees
    td = lapply(tree, function(x) geiger::treedata(x, data, warnings = TRUE))
    tree = lapply(td, function(x) x$phy)
    data = td[[1]]$data
  }

  # write files
  if(missing(filename)){
    filename = paste0(variables, collapse = "-")
  }

  ape::write.nexus(tree, file = paste0(dir, filename, ".bttrees"))
  write.table(data, file = paste0(dir, filename, ".btdata"),
              quote = FALSE, col.names = FALSE, sep = "\t")
}

#' Read BayesTraits Log files
#'
#' Given a the path of a BayesTraits log file, this function will find the start of the logged output and import the data as a data.frame into R.
#' @keywords excd, BayesTraits, phylogeny
#' @param filename the path to the BayesTraits log file
#' @return A data.frame of the logs found in the BayesTraits log file
#' @export

read.bayestraits <- function(filename){
  con = file(filename, "r")
  i = 1
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if (grepl("\t", line)) {
      break
    }
    i = i + 1
  }
  close(con)

  read.table(filename, skip = i-1, sep = '\t', header = TRUE, check.names = FALSE)
}

