import hector.*
import wollok.game.*

class Cultivos{
	var property position
	var property esUnaPlanta=true
	method enCosecha(){
		hector.guardarPlantaParaVender(self)
		game.removeVisual(self)
	}
	
}

class Maiz inherits Cultivos{
	var property image = "corn_baby.png"
	
	
	
	method enRegado(posicion){
			if(self.image()=="corn_baby.png")
			game.removeVisual(self)
			self.image("corn_adult.png")
			game.addVisual(self)
		}
		

		
	
	
	
	method valorDeVenta(){
		return 150
	}
	
	
	
	
	
}

class Trigo inherits Cultivos{
	var property image = "wheat_0.png"
	var property evolucion=["wheat_0.png","wheat_1.png","wheat_2.png","wheat_3.png"]
	var property etapaDeEvolucion=0
	
	method enRegado(posicion){
		return if(etapaDeEvolucion<3){
			self.image(evolucion.get(etapaDeEvolucion + 1))
			etapaDeEvolucion+=1
			
		}
		else{ etapaDeEvolucion-=3
				self.image(evolucion.get(etapaDeEvolucion))
			
		}
		}
		
		
		
		
	
	method valorDeVenta(){
		return (etapaDeEvolucion - 1) * 100
	}
	
}



class Tomaco inherits Cultivos{
	var property image= "tomaco_baby.png"
	
	method enRegado(posicion){
		if(self.image()=="tomaco_baby.png"and posicion.y()!=9){
			game.removeVisual(self)
			self.image("tomaco.png")
		game.addVisualIn(self,self.nuevaPosicion())
		
			
		}
		else{
			self.image("tomaco.png")
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
	
	
	
	method valorDeVenta(){
		return 80 
	}
}










