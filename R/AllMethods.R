#---------------------------------------------------------------------
# Script Name:   AllMethods.R
# Description:   All classes for rTASSEL
# Author:        Brandon Monier & Ed Buckler
# Created:       2018-12-11 at 20:31:01
# Last Modified: 2018-12-11 at 21:55:45
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this Rscript is to house methods for 
#    rTASSEL classes
#--------------------------------------------------------------------

#' @include AllGenerics.R


#--------------------------------------------------------------------
# GenotypeTable Methods
#--------------------------------------------------------------------

#' @title Display overview when object is called
#'
#' @rdname show-methods
#' @aliases show,GenotypeTable-method
#' @exportMethod show
setMethod(
    f = "show",
    signature = "GenotypeTable",
    definition = function(object) {
        cat("Genotype Table Name: ",object@name,"\n")
        cat(is(object)," wraps ", show(object@jtsGenotypeTable) ,"\n")
        cat("Sites: ",object@jtsGenotypeTable$numberOfSites(), " Taxa: ",object@jtsGenotypeTable$numberOfTaxa(),"\n")
    }
)


#' @title Get positions for GenotypeTable class objects
#'
#' @rdname positions-methods
#' @aliases positions,GenotypeTable-method
#' @exportMethod positions
setMethod(
    f = "positions",
    signature = "GenotypeTable",
    definition = function(object) {
        new("PositionList",name="TASSEL Position List", jtsPositionList=object@jtsGenotypeTable$positions())
    }
)


#' @title Get taxa for GenotypeTable class objects
#'
#' @rdname taxa-methods
#' @aliases taxa,GenotypeTable-method
#' @exportMethod taxa
setMethod(
    f = "taxa",
    signature = "GenotypeTable",
    definition = function(object) {
        new("TaxaList",name="TASSEL Taxa List", jtsTaxaList=object@jtsGenotypeTable$taxa())
    }
)



#--------------------------------------------------------------------
# PositionList Methods
#--------------------------------------------------------------------

#' Show positions lists
#'
#' @rdname show-methods
#' @aliases show,PositionList-method
#' @exportMethod show
setMethod(
  f = "show",
  signature = "PositionList",
  definition = function(object) {
    cat("Position List Name: ",object@name,"\n")
    cat(is(object)," wraps ", show(object@jtsPositionList) ,"\n")
    cat("Sites: ",object@jtsPositionList$size(),"\n")
  }
)



#--------------------------------------------------------------------
# TaxaList Methods
#--------------------------------------------------------------------

#' Show method for TaxaList class objects
#' 
#' @rdname show-methods
#' @aliases show,TaxaList-method
#' @exportMethod show
setMethod(
  f = "show",
  signature = "TaxaList",
  definition = function(object) {
    cat("Taxa List Name: ",object@name,"\n")
    cat(is(object)," wraps ", show(object@jtsTaxaList) ,"\n")
    cat("Taxa: ",object@jtsTaxaList$size(),"\n")
  }
)
