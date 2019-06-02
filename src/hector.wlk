import wollok.game.*
import plantas.*

object hector{
	var property plantas=[]
	var property position= game.at(1,1)
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
		
		method precioDeLasPlantasEnTotal(){
		return plantas.map({planta=>planta.valorDeVenta()}).sum()
		}
		
		method venderPlantas(){
			ahorros= ahorros + self.precioDeLasPlantasEnTotal()
			plantas=[]
			
			
			
			
		}
		
		
		
		
		
		
		
		method regarSiHayPlantas(){
			var plantasQueColisionan= game.colliders(self)
			if(plantasQueColisionan.isEmpty()){
				game.error ("no hay plantas para regar en este momento")
			}
			else{
				self.regarPlantas(plantasQueColisionan)
			
				
			}
			}
			
			
			method regarPlantas(_plantas){
				_plantas.forEach({planta=>self.regar(planta)})
				
			}
			

		
		method cosecharSiHayPlantas(){
			var plantasQueColisionan=game.colliders(self)
			if(plantasQueColisionan.isEmpty()){
			game.error("no hay plantas para cosechar en este momento")
		}
		else{
			plantasQueColisionan.forEach({planta=>self.cosechar(planta)})
			
		}
		
		}
		
		method regar(planta){
		
		if(planta.image() == "corn_baby.png"){
			
			planta.enRegado(self.position())
			
		
		}else if (planta.image() ==  "tomaco.png"){
			
			planta.enRegado(self.position())
			
		}else{
			
			planta.enRegado(self.position())
		}
	}
		
		method cosechar(planta){
		
		if(planta.image() == "corn_adult.png"){
			
			planta.enCosecha()
			
		
		}else if (planta.image() ==  "tomaco.png"){
			
			planta.enCosecha()
			
		}else if(planta.image() == "wheat_2.png" or planta.image() == "wheat_3.png"){
			
			planta.enCosecha()
			
		}else{
			
			 game.say(self, "No tengo nada para cosechar")
		}
	}
	
method informar(){
	game.say(self,"tengo " + ahorros + " monedas " +  " y " + plantas.size() + " plantas para vender ")
}		
		
		
		
		
		
		



 
	
	
}



