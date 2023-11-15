import campeones.*

class Oleada {
	var minions
	var plusDeDanio
	
	method minions() = minions
	
	method danio() = minions + plusDeDanio
	
	method reducirPlusDeDanioPor(unCampeon) {
		if(unCampeon.puntosDeAtaque().between(20, 40)) {
			plusDeDanio = 0.max(plusDeDanio - 1)
		}
		else if(unCampeon.puntosDeAtaque() > 40) {
			plusDeDanio = 0.max(plusDeDanio - 2)
		}
	}
	
	method recibirDanioDe(unCampeon) {
		self.recibirDanio(unCampeon.puntosDeAtaque())
		self.reducirPlusDeDanioPor(unCampeon)
	}
	
	method recibirDanio(valorDeDanio) {
		minions = 0.max(minions - (valorDeDanio / 2) )
	}
}

class Ejercito {
	const oleadas = #{}
	
	 method danio() = oleadas.sum({o => o.danio()})
	
	method batallarCon(unCampeon) {
		if(oleadas.size() > 1) {
			oleadas.first().recibirDanioDe(unCampeon)
		}
		else {
			const efectoPorLaMitad = unCampeon.puntosDeAtaque().div(2)
			oleadas.forEach({o => o.recibirDanioDeDe(efectoPorLaMitad)})
		}
	}
}
