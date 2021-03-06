rrricanes 0.1.3 (2017-06-11)
============================

### NEW FEATURES

* NA

### MINOR IMPROVEMENTS

* `rrricanes.http_sleep` to control time to sleep between multiple HTTP requests.
* Clarified documentation for `get_fstadv`, `get_prblty`, `get_wndprb`, `tidy_fstadv`, `tidy_wr`, `tidy_fcst` and `tidy_fcst_wr`.

### BUG FIXES

* `tidy_fcst` and `tidy_fcst_wr` would err if all forecast periods were not available for a cyclone. Functions now analyze dataframe to determine what forecast fields exist, then tidies based on the result. (#73)

### DEPRECATED AND DEFUNCT

* NA

rrricanes 0.1.2 (2017-06-08)
============================

### NEW FEATURES

* Changed name from `Hurricanes` to `rrricanes`.

* `get_storm_data` can now be chained to other commands and returns a list of dataframes.

* `load_storm_data` accesses pre-scraped datasets and returns requested products through the github repo `rrricanesdata`. This was done to make it quicker to get data. It should not be relied on to get the most immediate data for current storms. However, it should be fairly up-to-date. Original functions can be used if for some reason immediate data access is needed.

* `saffir` returns Saffir-Simpson classification of tropical cyclones; abbreviated.

* `status_abbr_to_str` converts storm status abbreviations (i.e., TD, TS, HU) to string.

* `twoal` and `twoep` parse tropical weather outlook XML files. Gives current status, if any, of areas of interest in either basin.

### MINOR IMPROVEMENTS

* Modified numerous regex patterns to ensure data quality.
* `tidy_fstadv`, `tidy_wr`, `tidy_fcst` and `tidy_fcst_wr` have been added to replaced now-removed `fstadv_split()`.
* Added loop to make multiple attempts at extracting contents from NHC archives. Options `rrricanes.http_timeout` and `rrricanes.http_attempts` added to give user more control over this. Default is 3 attempts with no more than 5 permitted.

### BUG FIXES

* Too many to recall. Apologies. 
* Call to `get_storms` on some linux distros generated xpath_element error. Corrected. (#67)
* Modify call to `get_storm_data`. Replaced css parameter in `rvest::html_nodes` calls with xpath parameter. Some products (notably, `get_prblty`) do not have a "pre" tag but are text documents (not HTML). Modified `scrape_contents` to return full contents if "pre" tag doesn't exist. Tested `get_discus` and `get_public`; no errors generated. (#68)

### DEPRECATED AND DEFUNCT

* `fstadv_split`. See MINOR IMPROVEMENTS for alternatives.

Hurricanes 0.1.0 (2017-05-12)
================

## Major new features

Retrieve all storm's for a given year (>=1998) and access data from a given storm's history. Can access "current" storm position, structure details, forecast, and discussions.

This release should be considered beta. While I've made every effort to ensure quality there may be an issue here or there. I will work on developing QA/QC scripts as time permits.

Please send any issues or questions to: https://github.com/timtrice/Hurricanes/issues.

### Getting Annual Storm Data

Use `get_storms` to access storm's for a given year.

### Getting Storm Data

Use `get_storm_data` to access one or multiple products for a specific storm.

#### Storm Discussions (discus)

Not parsed but contains technical information on the cyclone, development tendencies and forecast model tendencies.

#### Forecast/Advisory (fstadv)

Contains the meat of data. Current storm information, forecast information, wind and sea data. Can use `fstadv_split()` to break the wide dataframe to multiple, relational dataframes.

#### Position Estimate (posest)

Contains current position estimate for a given storm. Usually issued during threats to land. Not issued for all storms. Not parsed. 

#### Strike Probabilities (prblty)

Strike probabilities for given locations prior to 2006 (See Wind Speed Probabilities for >= 2006). 

#### Public Advisory (public)

General information on a storm. Not parsed.

#### Updates (update)

Quick information given when a storm is threatening or undergoes a significant change. Not issued for all storms.

#### Wind Probabilities (wndprb)

Replaced Strike Probabilities after the 2005 hurricane season. Lists the chances of a location seeing 34kt, 50kt and 64kt winds within a given time frame.
