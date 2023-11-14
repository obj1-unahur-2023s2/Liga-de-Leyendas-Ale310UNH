import campeones.*

class Oleada {
	var minions
	var plusDeDanio
	
	method minions() = minions
	
	method danio() = minions + plusDeDanio
	
	method recibirDanioDe(unCampeon) {
		minions = 0.max(minions - (unCampeon.puntosDeAtaque() / 2) )
		if(unCampeon.puntosDeAtaque().between(20, 40)) {
			plusDeDanio = 0.max(plusDeDanio - 1)
		}
		else if(unCampeon.puntosDeAtaque() > 40) {
			plusDeDanio = 0.max(plusDeDanio - 2)
		}
	}
}

class Ejercito inherits Oleada {
	const oleadas = #{}
	
	override method danio() = oleadas.
}
