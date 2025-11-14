import example.*
import pacientesEspeciales.*

object centro{
  const aparatos = []
  const pacientes = []

  method coloresDeAparatos(){
    return aparatos.map({a => a.color()}).asSet()
  }

  method pacientesMenores(){
    return pacientes.filter({p => p.edad() < 8})
  }

  method pacientesQueNoPuedenHacerSuSesion(){
    return pacientes.count({p =>
      !p.puedeHacerRutina()
    })
  }

  method optimasCondiciones(){
    return aparatos.all({a => !a.necesitaMantenimiento()})
  }

  method estaComplicado(){
    const mitadDeAparatos = aparatos.size() / 2
    const cantNecesitanMantenimiento = aparatos.count({a => a.necesitaMantenimiento()})
    return cantNecesitanMantenimiento >= mitadDeAparatos
  }

  method visitaTecnica(){
    aparatos.forEach({a =>
      if(a.necesitaMantenimiento()){
        a.mantener()
      }
    })
  }

}