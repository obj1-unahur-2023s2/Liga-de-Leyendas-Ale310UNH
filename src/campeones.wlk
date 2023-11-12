class Campeon {
	var puntosDeDanioAcumulado
	var puntosDeVidaPropio
	var puntosDeAtaque
	const property items = []
	var puntosdeVida = puntosDeVidaPropio + items.map({i => i.puntosDeVidaOtorgados()}).sum()
	
	method estaMuerto() = puntosDeDanioAcumulado >= puntosDeVidaPropio
}
