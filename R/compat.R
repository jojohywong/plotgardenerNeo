## Compatibility bindings for internal plotgardener helpers.
##
## plotgardenerNeo reuses a small number of internal helpers from the
## prerequisite plotgardener package. Keeping the bindings explicit makes it
## clear which internals are required by this companion package.

parseParams <- function(...) {
    plotgardener:::parseParams(...)
}

justConversion <- function(...) {
    plotgardener:::justConversion(...)
}

misc_defaultUnits <- function(...) {
    plotgardener:::misc_defaultUnits(...)
}

getExons <- function(...) {
    plotgardener:::getExons(...)
}

check_page <- function(...) {
    plotgardener:::check_page(...)
}

## Local copy of plotgardener's internal count clamping helper.
scale_data <- function(upper, zrange) {
    if (!is.null(zrange)) {
        upper$counts[upper$counts <= zrange[1]] <- zrange[1]
        upper$counts[upper$counts >= zrange[2]] <- zrange[2]
    } else {
        upper$counts[upper$counts <= 0] <- 0
    }
    upper
}
