//
//  QuesoDePizza.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import UIKit

class QuesoDePizza: UIViewController {
    
    var pizza : Pizza = Pizza()
    var quesoActual : String = ""

    @IBOutlet weak var quesoPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let quesoSeleccionado = self.pizza.verQueso()
        let quesosDisponibles: [String] = self.pizza.quesosParaPizza()
        let indice: Int = quesosDisponibles.indexOf(quesoSeleccionado)!
        self.quesoPicker.selectRow(indice, inComponent: 0, animated: false)
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
        let quesos : [String] = pizza.quesosParaPizza()
        return quesos.count
    }
    
    // Funcion requerida para en la utilización de UIPickerViewDataSource: indica el texto que contendrá cada fila del Picker View
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let quesos : [String] = pizza.quesosParaPizza()
        quesoActual = quesos[row]
        return quesos[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pizza.cambiarQueso(quesoActual)
        let sigVista = segue.destinationViewController as! IngredientesDePizza
        sigVista.pizza = self.pizza
    }

    
}
