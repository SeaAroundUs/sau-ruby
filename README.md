## SeaAroundUs API Wrapper
Ruby wrapper for the [Sea Around Us API](https://github.com/SeaAroundUs/sau-web-mt).

The Sea Around Us data are licensed to the public under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License.  
Please read the data use policy described in the DATA_USE file.

This software is free software:  you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.  See the LICENSE file for a full statement of the License.


### Installation
```bash
$ gem install sau-ruby
```


### Example usage
```ruby
# include the helper library
require 'sau-ruby'

# get list of EEZs
eezs = SAU.get_regions('eez')

# get details for a single EEZ
brazil = eezs.get_by_title('Brazil (mainland)')
brazil.get_detail

# alternative way without getting the region list
brazil = SAU.get_region_detail('eez', 76)

# using LMEs for the next example
lmes = SAU.get_regions('lme')

# sample set of parameters for catch data
catch_data_params = {
  measure: 'tonnage',
  dimension: 'taxon',
  sciname: true,
  limit: 10
}

# get catch data for a single LME
north_sea = lmes.get_by_title('North Sea')
north_sea.get_data(catch_data_params)

# alternative way without getting the region list
north_sea.get_region_data('lme', 22, catch_data_params)
```


### Available parameters
Regions:
* eez
* lme
* rfmo
* fishing-entity

Measures:
* tonnage
* value

Dimensions:
* taxon
* commercialgroup
* functionalgroup
* country
* sector
* catchtype
* reporting-status

Other catch data parameters:
* limit (integer)
* sciname (boolean)
