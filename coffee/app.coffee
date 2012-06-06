Ext.Loader.setConfig( enabled: true )


Ext.application
  autoCreateViewport: true
  name: "carStore"


Ext.onReady ->
  Deft.Injector.configure
    appConfig:
      className: "carStore.appconfig.AppConfig"
      parameters: [ environment: "MOCK_DATA_ENV" ]

    carChartJson: "carStore.store.CarChartJson"
    carDataJson: "carStore.store.CarDataJson"