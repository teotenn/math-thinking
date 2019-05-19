
Tt.ppm <- function(solid,solution,concentration,mol=NULL,solid.u='g',solution.u='ml',concentration.u='mg', result.units=list(element='mg',sample='Kg'))
{
### Tranforming units
    ## Solid sample
    solid.g=switch(solid.u,
                   'g'=solid,
                   'mg'=solid/1000,
                   'ug'=solid/1000000,
                   'Kg'=solid*1000)
    ## Solution of the samples
    solution.l=switch(solution.u,
                      'l'=solution,
                      'ml'=solution/1000,
                      'ul'=solution/1000000)
    ## Units of the concentration (transform to g/liter)
    concentration.g=switch(concentration.u,
                           'g'=concentration,
                           'mg'=concentration/1000,
                           'ug'=concentration/1000000,
                           'Kg'=concentration*1000,
                           'M'=concentration*mol,
                           'mM'=(concentration*mol)/1000,
                           'uM'=(concentration*mol)/1000000)
### Proportion in g of soild sample per liter of solution
    proportion <- solid.g/solution.l
### Units to express the results
    ## Concentration of element in g/L to:
    concentration.g=switch(result.units[["element"]],
                           'g'=concentration.g,
                           'mg'=concentration.g*1000,
                           'ug'=concentration.g*1000000,
                           'Kg'=concentration.g/1000,
                           'M'=concentration/mol,
                           'mM'=(concentration/mol)*1000,
                           'uM'=(concentration/mol)*1000000)
    ## Concentration of sample in g/L to:
    proportion.g=switch(result.units[["sample"]],
                        'g'=proportion,
                        'mg'=proportion*1000,
                        'ug'=proportion*1000000,
                        'Kg'=proportion/1000)
### Calculate final expression
    results <- concentration.g/proportion.g
    results
}
