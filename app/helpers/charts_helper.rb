module ChartsHelper
  def users_count
    bar_chart ({"Jurados" => @countJury , "Estudiantes" => @countStudent , "Profesores" => @countTeacher , "Administradores" => @countAdmin , "Usuarios MultiRol" => (@rolesCreados - @totalnuser.number)}) , height: '300px', width:'50%', library: {
      title: {text: 'Usuarios creados', x: 0},
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

 def grading_count
    bar_chart ({"Sin asignar estado" => @countnoStatus , "Calificado" => @statuscalificado , "Calificando" => @statuscalificando , "Sin calificar" => @statussincalificar}) , height: '300px', width:'50%', library: {
      title: {text: 'Usuarios creados', x: -20},
      colors: ['red', 'orange', 'green', 'blue', 'purple', 'brown'],      yAxis: {
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

 def juries_counts
    pie_chart ({"Juries" => @countJury , "Roles" => @rolesCreados}) , height: '300px', width: '50%', library: {
      title: {text: 'Usuarios creados', x: -20},
      colors: ['red', 'orange', 'green', 'blue', 'purple', 'brown'],      yAxis: {
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

