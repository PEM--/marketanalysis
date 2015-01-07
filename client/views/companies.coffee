Template.companies.helpers
  companyKeys: [
    { name: 'Nom' }
    { name: 'Taille' }
    { name: 'Secteur' }
    { name: 'Code postal' }
    { name: 'Suiveurs' }
  ]
  companyList: ->
    data = []
    for company in Companies.find().fetch()
      val =
        name: company.name
        employeeCountRange: company.employeeCountRange.name
        industries: company.industries.values?[0].name
        location: company.locations.values?[0].address.postalCode
        numFollowers: company.numFollowers
      console.log val
      data.push val
    data
