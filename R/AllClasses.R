#---------------------------------------------------------------------
# Script Name:   AllClasses.R
# Description:   All classes for rTASSEL
# Author:        Brandon Monier & Ed Buckler
# Created:       2018-11-26 at 11:14:36
# Last Modified: 2018-12-11 at 21:55:45
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this Rscript produce wrapper classes for 
#    TASSEL classes
#--------------------------------------------------------------------


#--------------------------------------------------------------------
# GenotypeTable Class
#--------------------------------------------------------------------

#' @title Class GenotypeTable
#' 
#' @details Class \code{GenotypeTable} defines a GenotypeTable from TASSEL
#' 
#' @name GenotypeTable-class
#' @rdname GenotypeTable-class
#' @exportClass GenotypeTable
setClass(
  Class = "GenotypeTable",
  representation = representation(
    name = "character",
    jtsGenotypeTable = "jobjRef"
  )
  #todo - this class seems like it should inherit from jobjRef
  #contains = "jobjRef"
)


#' @title Wrapper function for GenotypeTable class object
#'
#' @param path a path to a \code{VCF} file
#'
#' @name GenotypeTable
#' @rdname GenotypeTable
#' @importFrom rJava .jcall
#' @export
GenotypeTable <- function(path) {
  new(
    Class = "GenotypeTable",
    #todo split path to only grab the filename
    name = paste0("PATH:",path),
    jtsGenotypeTable = rJava::.jcall(
      "net/maizegenetics/dna/snp/ImportUtils",
      "Lnet/maizegenetics/dna/snp/GenotypeTable;",
      "read",
      path
    )
  )
}



#---------------------------------------------------------------------
# PositionList Class
#---------------------------------------------------------------------

#' A R Wrapper for the PositionList class
#' 
#' @details Class \code{PositionList} defines a PositionList from TASSEL
#' 
#' @name PositionList-class
#' @rdname PositionList-class
#' @exportClass PositionList
setClass(
  Class = "PositionList",
  representation = representation(
    name = "character",
    jtsPositionList = "jobjRef"
  )
  #todo - this class seems like it should inherit from jobjRef
  #contains = "jobjRef"
)



#---------------------------------------------------------------------
# TaxaList Class
#---------------------------------------------------------------------

#' A R Wrapper for the TaxaList class
#' 
#' @details Class \code{TaxaList} defines a TaxaList from TASSEL
#' 
#' @name TaxaList-class
#' @rdname TaxaList-class
#' @exportClass TaxaList
setClass(
  Class = "TaxaList",
  representation = representation(
    name = "character",
    jtsTaxaList = "jobjRef"
  )
  #todo - this class seems like it should inherit from jobjRef
  #contains = "jobjRef"
)



