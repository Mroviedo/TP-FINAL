import wollok.game.*
import objects.*

class Objeto{
	var property x=0
	var property y=0
	var property image=""
	method position() { return game.at(x,y)} 
	method medio(){return [x+8,y+8]}
}

class ObjetoIntereactivo inherits Objeto{
	var property item
}

class FactorySoil{
	var property type
	const list = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png"]
	method make(x,y){
		return new Objeto(x = x*16, y = y*16, image = list.get(type) )
	}
	method setType(t){type=t} 
	method makeMap(l){
		var map=[]
		l.forEach ({p=>
			type=p.get(2)
			map.add(self.make(p.get(0),p.get(1)))
		})
		return map
	}
}

class FactoryItem{
	var property type

	method make(x,y,t){
		return new ObjetoIntereactivo(x = x*16 ,y = y*16 ,image = itemdic.list().get(t).image(),item=itemdic.list().get(t))
	}
 	method makes(l){
		var lista=[]
		l.forEach({p=>lista.add(self.make(p.get(0), p.get(1), p.get(2)))})
		return lista
	}
/*     method make(x,y){
  		return new Objeto(x = x*16, y = y*16, image = itemlista.list.get(type) )
	}*/
	method setType(t){type=t} 
	
}


