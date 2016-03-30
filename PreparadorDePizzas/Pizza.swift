//
//  Pizza.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import Foundation

class Pizza {
    var tamaño: String? = nil
    var masa: String? = nil
    var queso: String? = nil
    var ingredientes: [String]? = nil
    
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
    
    func cambiarTamaño(tamaño: String?) {
        self.tamaño = tamaño
    }
    func cambiarMasa(masa: String?) {
        self.masa = masa
    }
    func cambiarQueso(queso: String?) {
        self.queso = queso
    }
    
    func añadirIngrediente(ingrediente: String) {
        self.ingredientes?.append(ingrediente)
    }
    
    func quitarIngrediente(ingrediente: String) {
        if let index = self.ingredientes?.indexOf(ingrediente) {
            self.ingredientes?.removeAtIndex(index)
        }
    }
}