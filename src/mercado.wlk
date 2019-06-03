import hector.*
import plantas.*
import wollok.game.*

class Mercado{
	var property cantDeMonedas=300
	var property esUnaPlanta=false
	var property mercaderia=[]
	var property position
	
	method image(){
		return "market.png"
	}
	
	method puedePagar(persona){
		return cantDeMonedas>=persona.ahorros()
	}
	
	method comprar(algo){
		mercaderia.add(algo)
		cantDeMonedas-=algo.valorDeVenta()
	}
	
}