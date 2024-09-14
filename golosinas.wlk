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

object pastillas {
    var property peso_inicial = 5
    var property sabores = ['Frutilla', 'Chocolate', 'Naranja']
    var property gluten = null
    var property precio = null
    var index = 0

    method gluten(_opcion) {
        gluten = _opcion
        if (_opcion) precio = 7 else precio = 10
    }
    
    method mordisco() {
        if (index == 0) {
            index += 1 
            return frutilla.sabor() 
        } else if (index == 1) {
            index += 1 
            return chocolate.sabor()
        } else {
            index = 0
            return naranja.sabor()
        }
    }
}

object frutilla {
    method sabor() {
        return 'Frutilla'
    }
}

object chocolate {
    method sabor() {
        return 'Chocolate'
    }
}

object naranja {
    method sabor() {
        return 'Naranja'
    }
}