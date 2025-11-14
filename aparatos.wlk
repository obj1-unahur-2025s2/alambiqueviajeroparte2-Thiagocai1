class Aparato{
  const property color = "Blanco"
  method efecto(unPaciente)
}

class Magneto inherits Aparato{
  var imantacion = 800

  override method efecto(unPaciente){
    unPaciente.reducirDolor(unPaciente.dolor()*0.1)
    imantacion -= 1
  }
  
  method puedeSerUsadoPor(unPaciente){
    return true
  }

  method necesitaMantenimiento() = imantacion < 100

  method mantener(){
    imantacion += 500
  }

}

class Bici inherits Aparato{
  var tornillos = 0
  var aceite = 0

  override method efecto(unPaciente){
    if (unPaciente.dolor() > 30) tornillos+=1
    if (unPaciente.edad().between(30, 50)) aceite+=1
    unPaciente.reducirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }

  method puedeSerUsadoPor(unPaciente){
    return unPaciente.edad() > 8
  }

  method necesitaMantenimiento() = tornillos >= 10 || aceite >= 5

  method mantener(){
    tornillos = 0
    aceite = 0
  }
}

class Minitramp inherits Aparato{
  override method efecto(unPaciente){
    unPaciente.aumentarFortaleza(unPaciente.edad()*0.1)
  }

  method puedeSerUsadoPor(unPaciente){
    return unPaciente.dolor() < 20
  }

  method necesitaMantenimiento() = false

  method mantener(){}
}