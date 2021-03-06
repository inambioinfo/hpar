.hparEnv <- new.env(parent = emptyenv(), hash = TRUE)

## these rda files have been generated by inst/scripts/getHpaData.R
load(dir(system.file(package = "hpar", dir = "extdata"),
         full.name = TRUE,
         pattern = "hpaRelease.rda"))

assign("hpaVersion", hpaRelease["version"], envir = .hparEnv)
assign("hpaDate", hpaRelease["date"], envir = .hparEnv)
assign("hpaEnsembl", hpaRelease["ensembl"], envir = .hparEnv)

##' Function used to set the \code{hpadata} \code{hpar} option. 
##'
##' @title Sets the 'hpar' options
##' @param hpadata A \code{character} defining the default data to be
##'     queries. Choices are any of available \code{hpar} datasets,
##'     available by calling \code{\link{allHparData}}, or any
##'     unambiguous prefix.
##' @return Returns the set value of the \code{hpar} option.  Used for
##'     its side effect.
##' @author Laurent Gatto
##' @examples
##' oldOpt <- getHparOptions()
##' oldOpt
##' setHparOptions("hpaNormalTissue")
##' getHparOptions()
##' setHparOptions(oldOpt$hpadata)
setHparOptions <- function(hpadata = allHparData()) {
  hpadata <- match.arg(hpadata)
  opts <- getOption("hpar")
  if (is.null(opts))
    opts <- list()
  opts$hpadata <- hpadata
  options("hpar" = opts)
  invisible(hpadata)
}

##' Returns the \code{hapr} options. Currently, there is only
##' one, \code{hpadata}. See \code{\link{setHparOptions}} for
##' details and examples.
##'
##' @title Returns the \code{hpar} option.
##' @return A \code{list} with the \code{hpar} option(s). 
##' @author Laurent Gatto
getHparOptions <- function() options("hpar")
