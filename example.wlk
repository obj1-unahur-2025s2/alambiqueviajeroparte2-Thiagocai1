class Paciente{
  const property edad
  var fortaleza
  var dolor
  const rutina = []

  method dolor() = dolor
  method fortaleza() = fortaleza
  
  method usar(aparato){
    if(aparato.puedeSerUsadoPor(self))
    aparato.efecto(self)
  }

  method reducirDolor(cantidad){
    dolor -= cantidad
  }

  method aumentarFortaleza(cantidad){
    fortaleza += cantidad
  }

  method puedeHacerRutina(){
    return rutina.all({a => a.puedeSerUsadoPor(self)})
  }

  method hacerRutina(){
    if (self.puedeHacerRutina()){
      rutina.forEach({ a =>
        a.efecto(self)
      })
    }
  }
}

class Aparato{
  const property color = "Blanco"
  method efecto(unPaciente)
}

class Magneto inherits Aparato{
  override method efecto(unPaciente){
    unPaciente.reducirDolor(unPaciente.dolor()*0.1)
  }
  
  method puedeSerUsadoPor(unPaciente){
    return true
  }
}

class Bici inherits Aparato{
  override method efecto(unPaciente){
    unPaciente.reducirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }

  method puedeSerUsadoPor(unPaciente){
    return unPaciente.edad() > 8
  }
}

class Minitramp inherits Aparato{
  override method efecto(unPaciente){
    unPaciente.aumentarFortaleza(unPaciente.edad()*0.1)
  }

  method puedeSerUsadoPor(unPaciente){
    return unPaciente.dolor() < 20
  }
}