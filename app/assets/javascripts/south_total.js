if (document.getElementById('south_total')) {
        // 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('south_total'));

option = {
    tooltip : {
        formatter: "{a} <br/>{b} : {c}%"
    },
    // toolbox: {
    //     feature: {
    //         restore: {},
    //         saveAsImage: {}
    //     }
    // },
    series: [
        {
            name: 'Overall',
            type: 'gauge',
            detail: {formatter:'{value}%'},
            data: [{value: gon.data.south.total[2].toFixed(2)*100, name: 'Achieve%'}]
        }
    ]
};


   myChart.setOption(option);
      }

