object iniciar {
    method iniciar(choc, car, ban) {
        choc.peso_inicial(100)
        ban.golosina_baniada(car)
    }
}
object bombon {
    var property precio = 5
    var property sabor = 'Frutilla'
    var property peso_inicial = 15
    var property peso = self.peso_inicial()
    var property gluten = false

    method mordisco() {
        peso = (peso * 0.8) - 1
    }
}

object alfajor {
    var property precio = 12
    var property sabor = 'Chocolate'
    var property peso_inicial = 300
    var property peso = self.peso_inicial()
    var property gluten = true

    method mordisco() {
        peso *= 0.8
    }
}

object caramelo {
    var property precio = 1
    var property sabor = 'Frutilla'
    var property peso_inicial = 5
    var property peso = self.peso_inicial()
    var property gluten = false

    method mordisco() {
        peso -= 1
    }
}

object chupetin {
    var property precio = 2
    var property sabor = 'Naranja'
    var property peso_inicial = 7
    var property peso = self.peso_inicial()
    var property gluten = false

    method cantidad() {
        return peso < 2
    }
    method mordisco() {
        if (self.cantidad()) self.peso() else self.peso(self.peso()* 0.9)
    }
}

object oblea {
    var property precio = 5
    var property sabor = 'Vainilla'
    var property peso_inicial = 250
    var property peso = self.peso_inicial()
    var property gluten = true

    method cantidad() {
        return peso > 70
    }
    method mordisco() {
        if (self.cantidad()) self.peso(self.peso() * 0.5) else self.peso(self.peso() * 0.25)
    }
}

object chocolatin {
    var property precio = null
    var property sabor = 'Chocolate'
    var property peso_inicial = null
    var property peso = null
    var property gluten = true

    method peso_inicial(_peso) {
        peso_inicial = _peso
        peso = _peso
        self.precio(_peso * 0.5)
    }
    method mordisco() {
        peso -= 2
    }
}

object pastillas {
    var property peso_inicial = 5
    var property sabor = self.posibles_sabores().first()
    var property posibles_sabores = ['Frutilla', 'Chocolate', 'Naranja']
    var property gluten = null
    var property precio = null

    method gluten(_opcion) {
        //opcion debe tener los valores 'true' o 'false'
        gluten = _opcion
        if (gluten) precio = 10 else precio = 7
    }

    method mordisco() {
        //El sabor con el que viene por defecto (frutilla) lo añado devuelta al final de la lista
        self.posibles_sabores().add(self.sabor())
        //Lo borro del principio
        self.posibles_sabores().remove(self.sabor())
        //Y asigno el proximo a pastillas.sabor()
        self.sabor(self.posibles_sabores().first())
        return self.sabor()
    }
}

object banio_chocolate {
    var property precio = null
    var property sabor = null
    var property peso = null
    var property gluten = null
    var golosina = null
    var property baniado = null

    method golosina_baniada(_golosina) {
        precio = _golosina.precio() + 2
        sabor = _golosina.sabor()
        peso = _golosina.peso_inicial() + 4
        baniado = 4
        gluten = _golosina.gluten()
        golosina = _golosina
    }
    method baniado() {
        return baniado > 0
    }
    method mordisco() {
        golosina.mordisco()
        if (self.baniado()) baniado -= 2 else baniado = 0
    }
}

object mariano {
    var property compras = []
    method comprar(golosina) {
        compras.add(golosina)
        return compras
    }
    method desechar(golosina) {
        compras.remove(golosina)
        return compras
    }
    method probar() {
        compras.forEach({golosina => golosina.mordisco()})
        return compras.map({golosinas => golosinas.peso()})
    }
    method sin_tacc() {
        return compras.filter({golosina => !golosina.gluten()})
    }
    method precios() {
        return compras.all({golosina => golosina.precio() < 10})
    }
    method sabor(_sabor) {
        const removible = compras.filter({ golosina => golosina.sabor() == _sabor})
        return removible.get(0) // Va a devolver el primero xq las listas estan ordenadas
    }
    method sabores(_sabor) {
        return compras.filter({golosina => golosina.sabor() == _sabor})
    }
    method total_sabores() {
        // Tambien se podia hacer con .withoutDuplicates()
        const set = compras.asSet() //Lo paso a SET para borrar los repetidos
        return set.map({golosina => golosina.sabor()})
    }
    method cara() {
        const precios = #{}
        compras.forEach({golosina => precios.add(golosina.precio())})
        return precios.max()
    }
    method peso() {
        var peso_total = 0
        compras.forEach({golosina => peso_total = peso_total + golosina.peso()})
        return peso_total
    }



}


