library(dplyr)
library(purrr)
library(rrricanes)

## ---- Base Data --------------------------------------------------------------
## ---- * 1998, AL -------------------------------------------------------------
al1998 <- get_storms(year = 1998, basin = "AL") %>% dplyr::select(Link)

## ---- * 2008, AL -------------------------------------------------------------
al2008 <- get_storms(year = 2008, basin = "AL") %>% dplyr::select(Link)

## ---- * 1998, AL -------------------------------------------------------------
al1998 <- get_storms(year = 2008, basin = "AL") %>% dplyr::select(Link)

## ---- get_url_contents -------------------------------------------------------
df.get_url_contents <- rrricanes:::get_url_contents("http://httpbin.org/delay/0")
save(df.get_url_contents, file = "./inst/extdata/df.get_url_contents.Rda",
     compression_level = 9)

## ---- get_storm_data ---------------------------------------------------------
al_2017_storm_data <- get_storms(year = 2017, basin = "AL") %>%
    dplyr::slice(1) %>%
    .$Link %>%
    get_storm_data(products = c("discus", "fstadv"))
save(al_2017_storm_data, file = "./inst/extdata/al_2017_storm_data.Rda",
     compression_level = 9)

## ---- discus -----------------------------------------------------------------
## ---- * 2008, AL, 09 ---------------------------------------------------------
al092008.discus <- al2008 %>% slice(9) %>% .$Link %>% get_discus()
save(al092008.discus, file = "./inst/extdata/al092008.discus.Rda",
     compression_level = 9)

## ---- fstadv -----------------------------------------------------------------
## ---- * 2008, AL, 09 ---------------------------------------------------------
al092008.fstadv <- al2008 %>% slice(9) %>% .$Link %>% get_fstadv()
save(al092008.fstadv, file = "./inst/extdata/al092008.fstadv.Rda",
     compression_level = 9)

## ---- posest -----------------------------------------------------------------
## ---- * 2008, AL, 09 ---------------------------------------------------------
al092008.posest <- al2008 %>% slice(9) %>% .$Link %>% get_posest()
save(al092008.posest, file = "./inst/extdata/al092008.posest.Rda",
     compression_level = 9)

## ---- prblty -----------------------------------------------------------------
## ---- * 1998, AL, 01 ---------------------------------------------------------
al011998.prblty <- al1998 %>% slice(1) %>% .$Link %>% get_prblty()
save(al011998.prblty, file = "./inst/extdata/al011998.prblty.Rda",
     compression_level = 9)

## ---- public -----------------------------------------------------------------
## ---- * 2008, AL, 09 ---------------------------------------------------------
al092008.public <- al2008 %>% slice(9) %>% .$Link %>% get_public()
save(al092008.public, file = "./inst/extdata/al092008.public.Rda",
     compression_level = 9)

## ---- update -----------------------------------------------------------------
## ---- * 2008, AL, 09 ---------------------------------------------------------
al092008.update <- al2008 %>% slice(9) %>% .$Link %>% get_update()
save(al092008.update, file = "./inst/extdata/al092008.update.Rda",
     compression_level = 9)

## ---- wndprb -----------------------------------------------------------------
## ---- * 2008, AL, 09 ---------------------------------------------------------
al092008.wndprb <- al2008 %>% slice(9) %>% .$Link %>% get_wndprb()
save(al092008.wndprb, file = "./inst/extdata/al092008.wndprb.Rda",
     compression_level = 9)
