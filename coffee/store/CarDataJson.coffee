Ext.define( 'carStore.store.CarDataJson',
  extend: 'Ext.data.Store'
  mixins: ['Deft.mixin.Injectable']
  requires: [ 'carStore.model.CarDataModel' ]
  inject: [ 'appConfig' ]

  constructor: ( cfg ) ->
    me = this
    cfg = cfg or {}

    me.callParent( [ Ext.apply(
      autoLoad: true
      model: 'carStore.model.CarDataModel'

      proxy:
        type: 'ajax'
        url: @appConfig.getEndpoint( 'cars' ).url
        reader:
          type: 'json'
          root: @appConfig.getEndpoint( 'cars' ).root
      , cfg )
    ] )
)