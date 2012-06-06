Ext.define( 'carStore.controller.MyViewController',
  extend: 'Deft.mvc.ViewController'
  mixins: [ 'Deft.mixin.Injectable' ]
  inject: [ 'carChartJson', 'carDataJson' ]


  control:
    carGrid:
      selectionchange: 'onCarGridSelectionChange'

    carDetail: true
    carChartPanel: true


  config:
    carChartJson: null
    carDataJson: null


  init: ->
    @callParent( arguments )


  onCarGridSelectionChange: ( selectionModel, selections ) ->
    carDataModel = selections[0]
    @getCarDetail().update( carDataModel.getData() )
    @getCarChartJson().loadData( carDataModel.getData().quality )

)