## using base python functions only
def ppm (solid,solution,concentration,
         solid_u='g',solution_u='ml',concentration_u='mg',
         result_element='mg',result_sample='Kg'):
         """
Returns ppm (mg/Kg), ppb (ug/Kg) or as desired

It takes weigth of the solid in either g, mg, ug or Kg;
volume from the solution in l, ml or ul;
and concentration in g, mg, ug or Kg per liter.

Other parameters, and their default values include:
         *) solid_u = 'g'
         *) solution_u = 'ml'
         *) concentration_u = 'mg',
         *) result_element = 'mg'
         *) result_sample = 'Kg'
         """
         ## Make everything a list
         if isinstance(concentration, int) or isinstance(concentration, float):
                  concentration = [concentration]
         if isinstance(solid, int) or isinstance(solid, float):
                  solid = [solid for i in range(len(concentration))]
         if isinstance(solution, int) or isinstance(solution, float):
                  solution = [solution for i in range(len(concentration))]
         ## Make the solid sample to a gram
         solid_g = []
         for s in solid:
                  if solid_u == "g":
                           solid_g.append(s)
                  elif solid_u == "mg":
                           solid_g.append(s/1000)
                  elif solid_u == "ug":
                           solid_g.append(s/1000000)
                  elif solid_u == "Kg":
                           solid_g.append(s*1000)
                  else:
                           print("Unit for solid not recognised")
         ## Make solution to a liter
         solution_l = []
         for sol in solution:
                  if solution_u == "l":
                           solution_l.append(sol)
                  elif solution_u == "ml":
                           solution_l.append(sol/1000)
                  elif solution_u == "ul":
                           solution_l.append(sol/1000000)
                  else:
                           print("Unit for solution not recognised")
        ## Units of the concentration (transform to g/liter)
         concentration_g = []
         for c in concentration:
                  if concentration_u == "g":
                           concentration_g.append(c)
                  elif concentration_u == "mg":
                           concentration_g.append(c/1000)
                  elif concentration_u == "ug":
                           concentration_g.append(c/1000000)
                  elif concentration_u == "Kg":
                           concentration_g.append(c*1000)
                  else:
                           print("Unit in concentration not recognised")
         ## Proportion in g of soild sample per liter of solution
         proportion = []
         for i in range(len(solid_g)):
                  g_l = solid_g[i]/solution_l[i]
                  proportion.append(g_l)
         #proportion = solid_g/solution_l
         ## Change the concentration to the desired units
         for e in range(len(concentration_g)):
                  if result_element == "g":
                           concentration_g[e] = concentration_g[e]
                  elif result_element == "mg":
                           concentration_g[e] = concentration_g[e]*1000
                  elif result_element == "ug":
                           concentration_g[e] = concentration_g[e]*1000000
                  elif result_element == "Kg":
                           concentration_g[e] = concentration_g[e]/1000
                  else:
                           print("Unit in concentration not recognised")
         ## Change the proportion from g/L to:
         proportion_g = []
         for p in proportion:
                 if result_sample == "g":
                          proportion_g.append(p)
                 elif result_sample == "mg":
                          proportion_g.append(p*1000)
                 elif result_sample == "ug":
                          proportion_g.append(p*1000000)
                 elif result_sample == "Kg":
                          proportion_g.append(p/1000)
                 else:
                          print("Unit not recognised")
         ## End and return (concentration_g/proportion_g)
         resultado = []
         for j in range(len(proportion_g)):
                 prop = concentration_g[j]/proportion_g[j]
                 resultado.append(prop)
         return(resultado)
