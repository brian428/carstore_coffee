Ext.define( 'carStore.appconfig.AppConfig',


  statics:
    MOCK_DATA_ENV: 'mockdata'
    PRODUCTION_ENV: 'production'


  config:
    environment: null

    # Specify data endpoints for a mock data environment. If no match found, attempt to use the defaults.
    mockdata:
      endpoints:
        cars:
          url: 'data/cars.json'
          root: 'data'
        defaults:
          urlPrefix: 'data/'
          urlSuffix: '.json'
          dataRoot: 'data'

    # Specify data endpoints for production environment. If no match found, attempt to use the defaults.
    production:
      endpoints:
        cars:
          url: 'proddata/cars.json'
          root: 'proddata'
        defaults:
          urlPrefix: 'proddata/'
          urlSuffix: '.json'
          dataRoot: 'proddata'


  constructor: ( cfg ) ->
    if cfg?.environment and carStore.appconfig.AppConfig?[ cfg.environment ]
      @setEnvironment( carStore.appconfig.AppConfig[ cfg.environment ] )
    else
      @setEnvironment( carStore.appconfig.AppConfig.PRODUCTION_ENV )


  getEndpoint: ( endpointName ) ->
    environmentConfig = @[ @getEnvironment() ]
    endpoints = environmentConfig.endpoints
    defaults = environmentConfig.defaults

    if endpoints?[ endpointName ]
      result =
        url: endpoints[ endpointName ].url
        root: endpoints[ endpointName ]?.root ? defaults.dataRoot
    else
      result =
        url: defaults.urlPrefix + endpointName + defaults.urlSuffix
        root: defaults.dataRoot
)