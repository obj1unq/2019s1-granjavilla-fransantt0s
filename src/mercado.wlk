import hector.*
import plantas.*
import wollok.game.*

class Mercado{
	var property cantDeMonedas
	var property esUnaPlanta=false
	
	method puedePagar(){
		return cantDeMonedas>=hector.ahorros()
	}
	
}