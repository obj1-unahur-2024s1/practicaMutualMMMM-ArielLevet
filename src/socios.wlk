import actividades.*

class Socio {
	const actividadesRealizadas = []
	const maximoDeActividades
	const edad
	const idiomasQueHabla = []
	const tipoDeSocio
	
	method esAdoradorDelSol() = actividadesRealizadas.all{a => a.sirveParaBroncearse()}
	method actividadesEsforzadas() = actividadesRealizadas.map{a => a.implicaEsfuerzo()}
	method registrarActividad(a) = if (actividadesRealizadas.size() < maximoDeActividades) actividadesRealizadas.add(a) else self.error("Error")
	method leAtrae(actividad) {
		return (tipoDeSocio == "tranquilo" and actividad.cuantosDias() >= 4)
		or (tipoDeSocio == "coherente" and self.esAdoradorDelSol() and (actividad.sirveParaBroncearse() or actividad.implicaEsfuerzo()))
		or (tipoDeSocio == "relajado" and idiomasQueHabla.forAny{idioma => actividad.idiomas().any{idiomaDeActividad => idioma == idiomaDeActividad}})
	}
	
	method edad() = edad
	
	method esRecomendada(actividad){
		if (actividad.esViaje()){
			return actividad.esInteresante() and self.leAtrae(actividad) and not actividadesRealizadas.any(actividad)
		} else if (actividad.esGimnasia()){
			return self.edad() >= 20 and self.edad() < 30
		} else {
			return idiomasQueHabla.size() > 1
		}
	}
}
