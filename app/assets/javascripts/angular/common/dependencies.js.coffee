@dependencies = [
  #models
  [
    'accountO'
    'addressO'
    'avatarO'
    'budgetO'
    'bundleO'
    'childO'
    'currencyO'
    'currentUserO'
    'currentProfileO'
    'currentHrO'
    'demoUserO'
    'documentCategoryO'
    'guideO'
    'feedO'
    'hrO'
    'partnerO'
    'passwordO'
    'petO'
    'provinceO'
    'railsR'
    'sessionO'
    'stakeholderO'
    'userO'
    'walletO'
    'whitelabelF'
  ]

  # services
  [
    'feedS'
    'i18nS'
    'modalS'
    'templateS'
    'ngImgCrop'
    'ngSanitize'
  ]

  # filters
  [
    'dateFilters'
    'groupFilters'
    'hiddenFilter'
    'localeDateFilters'
    'truncateFilters'
    'utilFilters'
    'withFilter'
  ]

  # controllers
  [
    'parameterizeTemplateC'
  ]

  # ui-components
  [
    'ui-accordion'
    'ui-autoadjust-height'
    'ui-autoadjust-textarea'
    'ui-autosuggest'
    'ui-calendar'
    'ui-enter-submit'
    'ui-focus'
    'ui-message-bar'
    'ui-modal-box'
    'ui-revealer'
    'ui-scorefield'
    'ui-sticky-nav'
    'ui-tabs'
  ]

  # controllers
  []

  # librairies
  [
    'angular.filter'
    'ui.bootstrap.datetimepicker'
    'timestamp.datetimepicker'
    'rails'
    'ui-notification'
    'ui.router'
    'ui.router.stateHelper'
    'ngScrollable'
    'ngTouch'
    'templates'
  ]

  # directives
  [
    'accountsD'
    'addressesD'
    'avatarD'
    'bundleD'
    'buttonsD'
    'calendarFiltersD'
    'childrenD'
    'citiesD'
    'currenciesD'
    'currentUserD'
    'currentProfileD'
    'demoUserD'
    'eventsD'
    'expensesD'
    'feedsD'
    'guideContentsD'
    'guidesD'
    'guideSearchesD'
    'homeLinkD'
    'HrD'
    'inputD'
    'includeReplaceD'
    'inputErrorsD'
    'interfacesD'
    'i18nD'
    'mailsD'
    'menuD'
    'staticMenuD'
    'labeledNotesD'
    'partnerD'
    'passwordD'
    'petsD'
    'provincesD'
    'profileD'
    'sessionD'
    'stripeD'
    'stakeholderD'
    'submenuD'
    'transfereesD'
    #'userD'
  ]

].reduce (a, b) -> a.concat b
