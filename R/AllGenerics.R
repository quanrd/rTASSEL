#--------------------------------------------------------------------
# Script Name:   AllGenerics.R
# Description:   Various tests with rJava
# Author:        Brandon Monier & Ed buckler
# Created:       2018-11-26 at 11:14:36
# Last Modified: 2018-12-11 at 21:55:45
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this Rscript produce wrapper classes for 
#    TASSEL S4 generics
#--------------------------------------------------------------------

#' @title Get positions from TASSEL objects
#' 
#' @name positions
#' @rdname positions-methods
#' @exportMethod positions
setGeneric(
    name = "positions",
    def = function(object) {
        standardGeneric("positions")
    }
)


#' @title Get taxa from TASSEL objects
#' 
#' @name taxa
#' @rdname taxa-methods
#' @exportMethod taxa
setGeneric(
  name = "taxa",
  def = function(object) {
    standardGeneric("taxa")
  }
)