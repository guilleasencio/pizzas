//
//  TamanoDePizza.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import UIKit

class TamanoDePizza: UIViewController {
    
    var pizza : Pizza = Pizza()
    var tamañoActual : String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Funcion requerida para en la utilización de UIPickerViewDataSource: indica el numero de columnas que contendrá el Picker View
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // Funcion requerida para en la utilización de UIPickerViewDataSource: indica el numero de filas que contendrá un componente específico del Picker View
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let tamaños : [String] = pizza.tamañosParaPizza()
        return tamaños.count
    }
    
    // Funcion requerida para en la utilización de UIPickerViewDataSource: indica el texto que contendrá cada fila del Picker View
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let tamaños : [String] = pizza.tamañosParaPizza()
        tamañoActual = tamaños[row]
        return tamaños[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pizza.cambiarTamaño(tamañoActual)        
        let sigVista = segue.destinationViewController as! MasaDePizza
        sigVista.pizza = self.pizza
    }



   
}
