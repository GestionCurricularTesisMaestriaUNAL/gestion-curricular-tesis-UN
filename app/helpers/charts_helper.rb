module ChartsHelper
  def users_count
    bar_chart ({"Jurados" => @countJury , "Estudiantes" => @countStudent , "Profesores" => @countTeacher , "Administradores" => @countAdmin , "Usuarios MultiRol" => (@rolesCreados - @totalnuser.number)}) , height: '300px', width:'70%', library: {
      title: {text: 'Usuarios creados con rol', x: 0},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Contador de usuarios'
         }
      },
      xAxis: {
         title: {
             text: 'Roles de usuarios'
         }
      }
    }
end
def userspie_counts
   pie_chart ({"Jurados" => @countJury , "Estudiantes" => @countStudent , "Profesores" => @countTeacher , "Administradores" => @countAdmin}) , height: '300px', width: '50%', library: {
     title: {text: 'Roles asignados', x: 0},
     colors: ['red', 'orange', 'green', 'blue', 'purple', 'brown'],
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
 def usersrolpie_counts
    pie_chart ({"Usuarios con rol" => (@totalnuser.number - @countnoRol) , "Usuarios sin rol" => @countnoRol}) , height: '300px', width: '50%', library: {
      title: {text: 'Rol de usuarios', x: 0},
      colors: ['red', 'orange', 'green', 'blue', 'purple', 'brown'],      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Rol de usuarios'
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
    column_chart ({"Sin asignar estado" => @countnoStatus , "Calificado" => @statuscalificado , "Calificando" => @statuscalificando , "Sin calificar" => @statussincalificar}) , height: '300px', width:'70%', library: {
      title: {text: 'Estado de calificación tesis', x: -20},
      colors: ['red', 'orange', 'green', 'blue', 'purple', 'brown'],      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Numero de tesis'
         }
      },
      xAxis: {
         title: {
             text: 'Estado'
         }
      }
    }
  end
  def tesisjur_count
    bar_chart (@jurados.each) , height: '300px', width:'50%', library: {
      title: {text: 'Jurados vs tesis asignadas', x: 0},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Contador de usuarios'
         }
      },
      xAxis: {
         title: {
             text: 'Roles de usuarios'
         }
      }
    }
  end
 def juries_counts
    pie_chart ({"Jurados" => @countJury , "Roles" => @rolesCreados}) , height: '300px', width: '50%', library: {
      title: {text: 'Jurados creados', x: -20},
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
  def dategrade_count
    bar_chart ({"01-04-2017 - 15-04-2017" => @dategrade1, "16-04-2017 - 28-04-2017" => @dategrade2} ) , height: '300px', width:'70%', library: {
      title: {text: 'Tesis creadas en el tiempo', x: 0},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Número de tesis'
         }
      },
      xAxis: {
        type: 'datetime',
        title: {
            text: 'Fechas'
        },
       dateTimeLabelFormats: {
           month: '%e. %b',
           year: '%b'
      }
    }
  }
  end
end
