class Rutina {
    method caloriasQuemadas(tiempo){
    
        
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }

    method descanso(tiempo)

    method intensidad()

    
    


    

   
}

class Running inherits Rutina {
    const intensidad 
    
    override method descanso(tiempo){

        return if (tiempo > 20) 5 else 2
    }

   override method intensidad() = intensidad

}

class Maraton inherits Running{

    override method caloriasQuemadas(tiempo){

        return super(tiempo) * 2
    }
}

class Remo inherits Rutina{

    


    override method descanso(tiempo){

        return tiempo / 5
    }

    override method intensidad(){
        return 1.3
    }
}

class RemoCompeticion inherits Remo{

    override method intensidad() = 1.7

    override method descanso(tiempo){

        return self.descansoCompetitivo(super(tiempo)).max(2)
    }

    method descansoCompetitivo(aux) = aux -3
}

class Persona {
    

    method pesoPerdidoAlHacer(rutina){
        
        return rutina.caloriasQuemadas(self.tiempoEjercicio()) / self. kilosPorCalorias()
    }

    method kilosPorCalorias()

    method hacerRutina(rutina)

    method tiempoEjercicio()
}

class Sedentaria inherits Persona {
    const tiempo
    var peso

    override method kilosPorCalorias() = 7000
    override method tiempoEjercicio() = tiempo

    override method hacerRutina(rutina){
        self.validacionEjercicio()
        peso -= self.pesoPerdidoAlHacer(rutina)
    }

    method validacionEjercicio(){
       if( ! self.puedeEjercitarse() ){
            self.error("No puedo ejercicio")
       } 
    }

    method puedeEjercitarse() = peso > 50

    method peso() = peso

    method peso(_peso) {
        peso = _peso
    }
    

}

class Atleta inherits Persona {

    override method pesoPerdidoAlHacer(rutina){

        return super(rutina) - 1
    }
}