//
//  Pizza.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import Foundation

class Pizza {
    var tamaño: String = "chica"
    var masa: String = "delgada"
    var queso: String = "mozarela"
    var ingredientes: [String] = []
    
    let tamañosDisponibles : [String] = ["chica","mediana","grande"]
    let masasDisponibles : [String] = ["delgada","crujiente","gruesa"]
    let quesosDisponibles : [String] = ["mozarela","cheddar","parmesano","sin queso"]
    let ingredientesDisponibles : [String] = ["jamón","pepperoni","pavo","salchicha","aceituna","cebolla","pimiento","piña","anchoa","bacon","maíz","gambas","pollo","champiñones","atún"]
    
    func tamañosParaPizza() -> [String] {
        return tamañosDisponibles
    }
    
    func masasParaPizza() -> [String] {
        return masasDisponibles
    }
    func quesosParaPizza() -> [String] {
        return quesosDisponibles
    }
    
    func ingredientesParaPizza() -> [String] {
        return ingredientesDisponibles
    }
    
    func cambiarTamaño(tamaño: String) {
        self.tamaño = tamaño
    }
    func cambiarMasa(masa: String) {
        self.masa = masa
    }
    func cambiarQueso(queso: String) {
        self.queso = queso
    }
    
    func verTamaño() -> String {
        return self.tamaño
    }
    
    func verMasa() -> String {
        return self.masa
    }
    
    func verQueso() -> String {
        return self.queso
    }
    
    func verIngredientes() -> [String] {
        return self.ingredientes
    }
    
    // función para saber si una pizza tiene o no un ingrediente
    func tieneIngrediente(ingrediente: String) -> Bool {
        if self.ingredientes.indexOf(ingrediente) != nil {
            return true
        }else{
            return false
        }

    }
    
    func añadirIngrediente(ingrediente: String) {
        self.ingredientes.append(ingrediente)
    }
    
    func quitarIngrediente(ingrediente: String) {
        if let index = self.ingredientes.indexOf(ingrediente) {
            self.ingredientes.removeAtIndex(index)
        }
    }
    
    func totalIngredientes() -> Int {
        return self.ingredientes.count
    }
}