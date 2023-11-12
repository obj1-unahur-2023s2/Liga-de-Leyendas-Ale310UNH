class Item {
	var peso
	
	method puntosDeVidaOtorgadosA(unCampeon) {return
		if(peso <= 500) {
			20
		}
		else {
			40
		}
	}
	
	method puntosDeAtaqueOtorgadosA(unCampeon) {return
		if(peso <= 500) {
			10
		}
		else {
			5
		}
	}
}

class AnilloDeDoran inherits Item {
	
	override method puntosDeVidaOtorgadosA(unCampeon) = super(unCampeon) + 60
	
	override method puntosDeAtaqueOtorgadosA(unCampeon) = super(unCampeon) + 15
}

class TomoAmplificador inherits Item {
	
	override method puntosDeVidaOtorgadosA(unCampeon) = 
}