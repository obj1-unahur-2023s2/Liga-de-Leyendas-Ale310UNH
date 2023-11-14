import items.*

class Campeon {
	var puntosDeDanioAcumulado = 0
	const puntosDeVidaPropio
	const puntosDeAtaquePropio
	var unidadesDeBloqueo = 0
	const property items = []
	
	method sumarUnidadesDeBloqueo(unidades) {
		unidadesDeBloqueo += unidades
	}
	
	method puntosDeVida() = puntosDeVidaPropio + items.map({i => i.puntosDeVidaOtorgadosA(self)}).sum()
	
	method puntosDeAtaque() = puntosDeAtaquePropio + items.map({i => i.puntosDeAtaqueOtorgadosA(self)}).sum()
	
	method estaMuerto() = puntosDeDanioAcumulado >= puntosDeVidaPropio
	
	method puntosDeDanioAcumulado() = puntosDeDanioAcumulado
	
	method equiparItem(unItem) {
		items.add(unItem)
		puntosDeDanioAcumulado += unItem.efectoDeEquiparItem()
		unidadesDeBloqueo += unItem.efectoDeEquiparItem()
	}
	
	method desequiparItem(unItem) {
		items.remove(unItem)
		puntosDeDanioAcumulado += unItem.efectoDeDesequiparItem()
		unidadesDeBloqueo += unItem.efectoDeDesequiparItem()
	}
	
	method batallarContra(unaOleada) {
		if(unidadesDeBloqueo == 0) {
			puntosDeDanioAcumulado += unaOleada.danio()
		    unaOleada.recibirDanioDe(self)
		}
		else {
			unidadesDeBloqueo -= 1
		}
		
	}
	
	method puntosDeVidaMaximoQueOtorgaUnItemEquipado() = items.max({i => i.puntosDeVidaOtorgadosA(self)})
	
	method itemQueDeMasPuntosDeVida() = items.find({i => i.puntosDeVidaOtorgadosA(self) == self.puntosDeVidaMaximoQueOtorgaUnItemEquipado()})
	
	method itemsQueOtorganMasPuntosDeAtaqueQueDeVida() = items.filter({i => i.puntosDeVidaOtorgadosA(self) < i.puntosDeAtaqueOtorgadosA(self)})
	
	method algunItemOtorgaMasDe70HpOMasDe30Ap() = items.any({i => i.puntosDeVidaOtorgadosA(self) > 70 or i.puntosDeAtaqueOtorgadosA(self) > 30})
	
	method pesoDeItems() = items.map({i => i.peso()})
	
	method itemsConPesoMaDe300Gm() = items.filter({i => i.peso() < 300})
}
