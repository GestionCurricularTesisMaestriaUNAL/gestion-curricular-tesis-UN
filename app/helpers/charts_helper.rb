module ChartsHelper
  def users_count
    bar_chart @users.group(:firstname).count, height: '300px', library: {
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
