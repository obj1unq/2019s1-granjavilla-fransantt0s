import wollok.game.*
object hector{
	var property plantas=[]
	var property position= game.at(5,5)
	var property ahorros = 0
	
	method image(){
		return "player.png"
		}
		
	method sembrar(planta){
		game.addVisualIn(planta,self.position())
	}
	
		
		method guardarPlantaParaVender(planta){
			plantas.add(planta)
		}
		
		method mover(posicion){
			self.position(posicion)
		}
		
		method regar(_plantas){
			self.verSiHayPlantasParaRegar(_plantas)
			_plantas.forEach({planta=>planta.enRegado(self.position())})
		}
		
		method cosechar(_plantas){
			self.verSiHayPlantasParaCosechar(_plantas)
			_plantas.forEach({planta=>planta.enCosecha()})
			
		}
		
		method precioDeLasPlantasEnTotal(){
		return plantas.map({planta=>planta.valorDeVenta()}).sum()
		}
		
		method venderPlantas(){
			ahorros= ahorros + self.precioDeLasPlantasEnTotal()
			plantas=[]
			
			
			
			
		}
		
		
		
		
		
		
		
		method verSiHayPlantasParaRegar(_plantas){
			if(_plantas== null){
				game.error ("no hay plantas para regar en este momento")
			}
			
		}
		
		method verSiHayPlantasParaCosechar(_plantas){
			if(_plantas==null)
			game.error("no hay plantas para cosechar en este momento")
		}
	
		
		
		
		
		
		
		



 
	
	
}

object maiz{
	var property image = "corn_baby.png"
	
	method enRegado(posicion){
		if(image=="corn_baby.png"){
			self.image("corn_adult.png")
		}
		
	}
	method enCosecha(){
		if (self.esAdulto()){
			hector.guardarPlantaParaVender(self)
			game.removeVisual(self)
			
			
		}
		
	}
	
	method esAdulto(){
		return image== "corn_adult.png"
	}
	
	method valorDeVenta(){
		return 150
	}
	
	
	
	
	
}

object trigo{
	var property image = "wheat_0.png"
	var property evolucion=["wheat_0.png","wheat_1.png","wheat_2.png","wheat_3.png"]
	var property etapaDeEvolucion=0
	
	method enRegado(posicion){
		return if(etapaDeEvolucion<3){
			image= evolucion.get(etapaDeEvolucion + 1)
			etapaDeEvolucion+=1
			
		}
		else{ etapaDeEvolucion-=3
				image=evolucion.get(etapaDeEvolucion)
			
		}
		}
		method enCosecha(){
			if(etapaDeEvolucion>=2){
				hector.guardarPlantaParaVender(self)
				game.removeVisual(self)
			}
			
		}
		
		
		
		
	
	method valorDeVenta(){
		return (etapaDeEvolucion - 1) * 100
	}
	
}



object tomaco{
	var property image= "tomaco.png"
	
	method enRegado(posicion){
		if(posicion.y()!=9){
			game.removeVisual(self)
		game.addVisualIn(self,self.nuevaPosicion())
			
		}
		else{
			self.irHastaElFinal(posicion)
		}
			}
	method nuevaPosicion() {
		return hector.position().up(1)
	}
	
	method irHastaElFinal(posicion){
		game.removeVisual(self)
		game.addVisualIn(self, game.at(posicion.x(),0))
		
	}
	
	
	method enCosecha(){
		hector.guardarPlantaParaVender(self)
		game.removeVisual(self)
	}
	
	method valorDeLaPlanta(){
		return 80 
	}
}










