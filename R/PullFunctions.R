#---------------------------------------------------------------------
# Script Name:   PullFunctions.R
# Description:   Various pull functions for TASSEL objects
# Author:        Brandon Monier & Ed buckler
# Created:       2018-11-26 at 11:14:36
# Last Modified: 2018-12-11 at 21:55:45
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this Rscript is to house the various pull
#    functions for TASSEL objects
#--------------------------------------------------------------------

#' @title Get data frame of sample taxa from GenotypeTable
#' 
#' @description Extracts a data frame of sample taxa from
#'    \code{GenotypeTable} or \code{TaxaList} class objects.
#' 
#' @param jtsGenoTableOrTaxaList a \code{GenotypeTable} or \code{TaxaList}
#'    class object
#' 
#' @name sampleDataFrame
#' @rdname sampleDataFrame
#' 
#' @export
sampleDataFrame <- function(jtsGenoTableOrTaxaList) {
  if(is(jtsGenoTableOrTaxaList,"GenotypeTable")) {
    jtsTL <- taxa(jtsGenoTableOrTaxaList)@jtsTaxaList
  } else if(is(jtsGenoTableOrTaxaList,"TaxaList")) {
    jtsTL <- jtsGenoTableOrTaxaList@jtsTaxaList
  } else {
    jtsTL <- jtsGenoTableOrTaxaList
  }
  taxaArray <- c()
  for(i in 1:jtsTL$size()) {
    #why do I have to do -1L
    taxaArray[i] = toString(jtsTL$taxaName(i-1L))
  }
  colData <- data.frame(Sample=taxaArray)
  colData
}


#' @title Constructor for GRanges (GenomicRanges) class object
#' 
#' @description Extracts variant position information from each chromosome
#'    location and stores it as a GenomicRanges (\code{GRanges}) class object
#' 
#' @param jtsGenoTable a \code{GenotypeTable} class object
#' 
#' @name genomicRanges
#' @rdname genomicRanges
#' 
#' @importFrom GenomicRanges GRanges
#' @importFrom S4Vectors Rle
#' @importFrom IRanges IRanges
#' @export
genomicRanges <- function(jtsGenoTable) {
    if(is(jtsGenoTable,"GenotypeTable")) {
        jtsGT <- positions(jtsGenoTable)@jtsPositionList
    } else {
        stop("Object is not of \"GenotypeTable\" class")
    }
    
    numSite <- as.numeric(jtsGT$numberOfSites())
    physPos <- jtsGT$physicalPositions()
    
    cat("Extracting chromosome names for each postion...\n")
    cat("...is there a quicker way to get this? (~ Brandon)\n")
    chrName <- lapply(seq_len(numSite), function(pos) {
        jtsGT$chromosomeName(as.integer(pos - 1))
    })
    chrName <- unlist(chrName)
    
    gr2 <- GenomicRanges::GRanges(
        seqnames = S4Vectors::Rle(chrName),
        ranges = IRanges::IRanges(start = physPos, end = physPos)
    )
    return(gr2)
}
