class Viaje {
	const idiomas = []
	
	method idiomas() = idiomas
	method implicaEsfuerzo()
	method cuantosDias()
	method sirveParaBroncearse()
	method esInteresante() = idiomas.size() > 1
	
}

class ViajeDePlaya inherits Viaje {
	const largo
	
	override method implicaEsfuerzo() = return largo > 1200
	override method cuantosDias() = largo / 500
	override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje {
	const cuantasAtracciones
	
	override method implicaEsfuerzo() = return cuantasAtracciones >= 5 and cuantasAtracciones < 8
	override method cuantosDias() = cuantasAtracciones / 2
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or cuantasAtracciones == 5
	
	method cuantasAtracciones() = cuantasAtracciones
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	
	override method cuantosDias() = return super() + 1
	override method sirveParaBroncearse() = true
	
}

class SalidaDeTrekking inherits Viaje {
	const kmSendero
	const diasDeSol
	
	override method implicaEsfuerzo() = kmSendero > 80
	override method cuantosDias() = kmSendero / 50
	override method sirveParaBroncearse() = diasDeSol >= 100 and kmSendero > 120
	override method esInteresante() = super() and diasDeSol > 140
		
}

