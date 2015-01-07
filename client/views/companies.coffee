Template.companies.helpers
  screenSize: ->
    "[#{Math.min 960, (rwindow.innerWidth() ? 960)}, #{rwindow.innerHeight()}]"
  tableSize: ->
    "[#{Math.min 960, (rwindow.innerWidth() ? 960)}, true]"
  companyKeys: [
    { name: 'Nom' }
    { name: 'Taille' }
    { name: 'Secteur' }
    { name: 'Code postal' }
    { name: 'Suiveurs' }
  ]
  companyList: ->
    {
      name: company.name
      employeeCountRange: company.employeeCountRange.name
      industries: company.industries.values?[0].name
      location: company.locations.values?[0].address.postalCode
      numFollowers: company.numFollowers
    } for company in Companies.find().fetch()
