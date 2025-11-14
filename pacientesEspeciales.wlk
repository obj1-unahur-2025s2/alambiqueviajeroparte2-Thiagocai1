import example.*

class Resistente inherits Paciente{
  override method hacerRutina(){
    super()
    self.aumentarFortaleza(rutina.size())
  }
}

class Caprichoso inherits Paciente{
  override method puedeHacerRutina(){ return
    super() and rutina.any({a => a.color() == "Rojo"})
  }

  override method hacerRutina(){
    super()
    super()
  }
}

class RapidaRecuperacion inherits Paciente{
  override method hacerRutina(){
    super()
    self.reducirDolor(configRR.valor())
  }
}

object configRR{
  var valor = 3

  method valor() = valor
  method valor(cantidad){valor=cantidad}
}
