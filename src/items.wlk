import campeones.*

class Item {
	const property peso
	
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
	
	method puntosDeDanioEfectoDeEquiparse()
	
	method unidadesDeBloqueoEfectoAlEquiparse()
	
	method puntosDeDanioEfectoDeDesequiparse()
	
	method unidadesDeBloqueoEfectoAlDesequiparse()
}

class AnilloDeDoran inherits Item {
	
	override method puntosDeVidaOtorgadosA(unCampeon) = super(unCampeon) + 60
	
	override method puntosDeAtaqueOtorgadosA(unCampeon) = super(unCampeon) + 15
	
	override method puntosDeDanioEfectoDeEquiparse() = 5
	
	override method unidadesDeBloqueoEfectoAlEquiparse() = 0
	
	override method puntosDeDanioEfectoDeDesequiparse() = -10
	
	override method unidadesDeBloqueoEfectoAlDesequiparse() = 0
}

class TomoAmplificador inherits Item {
	
	override method puntosDeVidaOtorgadosA(unCampeon) = super(unCampeon) + ((unCampeon.puntosDeDanioAcumulado()*25)/100)
	
	override method puntosDeAtaqueOtorgadosA(unCampeon) = super(unCampeon) + ((unCampeon.puntosDeDanioAcumulado()*10)/100)
	
	override method puntosDeDanioEfectoDeEquiparse() = 0
	
	override method unidadesDeBloqueoEfectoAlEquiparse() = 2
	
	override method puntosDeDanioEfectoDeDesequiparse() = 30
	
	override method unidadesDeBloqueoEfectoAlDesequiparse() = 0
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method puntosDeVidaOtorgadosA(unCampeon) = super(unCampeon) - ((unCampeon.puntosDeDanioAcumulado()*25)/100) + ((unCampeon.puntosDeDanioAcumulado()*25)/100) * 2
	
	override method puntosDeAtaqueOtorgadosA(unCampeon) = super(unCampeon) + 2
	
	override method puntosDeDanioEfectoDeEquiparse() = 10
	
	override method puntosDeDanioEfectoDeDesequiparse() = 0
	
	override method unidadesDeBloqueoEfectoAlDesequiparse() = 0
}

class BastonDelVacio inherits Item {
	const itemsDentro = []
	
	override method puntosDeVidaOtorgadosA(unCampeon) = super(unCampeon) + itemsDentro.sum({i => i.puntosDeVidaOtorgadosA(unCampeon)})
	
	override method puntosDeAtaqueOtorgadosA(unCampeon) = super(unCampeon) + itemsDentro.sum({i => i.puntosDeAtaqueOtorgadosA(unCampeon)})
}