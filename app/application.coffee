Application =
  chart: null
  
  initialize: ->
    self = @
    
    @initChart()
    
    try
      socket = io.connect('http://localhost:3000')
    
      socket.on 'addPoint', (data) ->
        self.chart.series[1].setData(data)
    catch error
      console.log "Socket Error: #{error}"
    
  initChart: ->
    Highcharts.setOptions
      global:
        useUTC: false
        
    @chart = new Highcharts.Chart
      chart:
        renderTo: 'chart'
        type: 'bar'
      title:
        text: 'Apples Eaten per Region'
      xAxis:
        categories: ['America', 'Asia', 'Europe']
        title:
          text: null
      yAxis:
        min: 0
        title:
            text: 'Apples Eaten'
            align: 'high'
        labels:
            overflow: 'justify'
      tooltip:
        formatter: ->
          series_name = this.series.name
          y = this.y
          
          return "#{series_name}: #{y}"
      plotOptions:
        bar:
          dataLabels:
            enabled: true
      legend:
        enabled: false
      exporting:
        enabled: false
      credits:
        enabled: false
      series: [
        {name: '2011', data: [750, 1000, 1250]},
        {name: '2012', data: [250, 500, 750]}
      ]

module.exports = Application