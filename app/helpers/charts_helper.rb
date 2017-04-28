module ChartsHelper
  def users_count
    bar_chart @countJury, height: '500px', library: {
      title: {text: 'Usuarios creados', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Contador de usuarios'
         }
      },
      xAxis: {
         title: {
             text: 'Usuarios'
         }
      }
    }
  end
end
