#' Pair a D-Place csv file to a D-place phylogeny
#'
#' When downloading a phylogeny and csv file from D-place there is no direct link between the two files. This function will connect the two using additional identifying files.
#' @keywords excd, d-place, phylogeny
#' @param tree an object of class phylo or list of phylo objects
#' @param csv the imported dataframe from D-PLACE
#' @param id character of the language family for which you have a phylogeny for (e.g. "austro", "bantu" or "uto-aztecan")
#' @return \item{data} a dataframe subset to those societies existing in tree
#' \item{phy} a phylogeny pruned to match the data you input
#' @export

pair_dplace = function(tree, csv, family){

  id = ids[[family]]

  id$priority_id = sapply(id$xd_id, .first_id)
  id = id[!is.na(id$priority_id),]
  id = id[order(id$xd_id),]

  csv = csv[order(csv$Cross.dataset.id),]
  csv = merge(csv, id, by.x = "Cross.dataset.id", by.y = "priority_id")
  csv = csv[!duplicated(csv$Cross.dataset.id),]
  rownames(csv) = as.character(csv$Name_on_tree_tip)

  if(is.phylo(tree)){
    treedata2(phy = tree, data = csv)
  } else {
    lapply(tree, function(t) treedata2(phy = t, data = csv))
  }
}

.first_id = function(id){
  id %>%
    as.character(.) %>%
    gsub('[[:space:]]', '', .) %>%
    strsplit(., ',') %>%
    unlist(.) %>%
    .[1]
}
