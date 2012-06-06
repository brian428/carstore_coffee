Ext.define( 'carStore.store.CarChartJson',
  extend: 'Ext.data.Store',
  requires: [ 'carStore.model.CarChartModel' ]

  model: 'carStore.model.CarChartModel'
  proxy:
    type: 'ajax'
    reader:
      type: 'json'

)