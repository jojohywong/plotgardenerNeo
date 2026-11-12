# plotgardenerNeo

`plotgardenerNeo` is a companion package for **plotgardener 1.15.1**. It adds
neo-chromosome assembly, neo Hi-C reconstruction/plotting, IGV-style neo gene
tracks, and helpers for mapping genome-wide signal tracks into neo
coordinates.

It exports only Neo-specific functions:

- `readNeoAssembly()`
- `readNeoHic()`
- `plotNeoHic()`
- `plotNeoAssembly()`
- `annoNeoDomains()`
- `annoNeoFragmentLabels()`
- `plotNeoGenes()`
- `mapNeoFeatures()`
- `getNeoSignal()`
- `getNeoV4C()`

Core plotgardener functions such as `plotHicSquare()`, `plotSignal()`, and
`readCool()` stay in plotgardener; loading `plotgardenerNeo` does not mask
them.

## Prerequisite

`plotgardenerNeo` requires the patched plotgardener fork:

```text
plotgardener (>= 1.15.1.9000)
```

The patched core provides the `.mcool` extraction fixes and the
interchromosomal/raster/axis updates used by the neo functions.

## Install

Install the patched plotgardener prerequisite first, then install
`plotgardenerNeo`.

Using GitHub:

```r
# install.packages("remotes")

remotes::install_github("jojohywong/plotgardener", ref = "1.15.1.9000")
remotes::install_github("jojohywong/plotgardenerNeo")
```

Using source tarballs:

```r
remotes::install_local("plotgardener_1.15.1.9000.tar.gz")
remotes::install_local("plotgardenerNeo_1.15.1.9000.tar.gz")
```

To keep these packages out of the default R library:

```r
lib <- file.path(Sys.getenv("HOME"), "R", "neo-library")
dir.create(lib, recursive = TRUE, showWarnings = FALSE)

remotes::install_github(
    "jojohywong/plotgardener",
    ref = "1.15.1.9000",
    lib = lib
)
remotes::install_github("jojohywong/plotgardenerNeo", lib = lib)

.libPaths(c(lib, .libPaths()))
library(plotgardenerNeo)
```

## Build

```bash
R CMD build plotgardenerNeo --no-build-vignettes --no-manual
```

## Behavior note

The package itself adds only new Neo functions. The patched plotgardener
prerequisite contains behavior changes relative to upstream 1.15.1, including
`.mcool` fixes, interchromosomal orientation, rasterization options, and
changed default axis styling. Keep the patched core in a separate R library if
you need the original plotgardener installation to remain untouched.
