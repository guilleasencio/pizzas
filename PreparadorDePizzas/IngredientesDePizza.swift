//
//  IngredientesDePizza.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import UIKit

class IngredientesDePizza: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pizza : Pizza = Pizza()
    let maximoIngredientes : Int = 5
    
    var ingredientesDisponibles : [String] = []
    
    //Botones
    @IBOutlet weak var siguienteButton: UIButton!
    
    //Table View
    @IBOutlet weak var tablaIngredientes: UITableView!
    
    //Labels
    @IBOutlet weak var seleccionadosLabel: UILabel!
    @IBOutlet weak var restantesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ingredientesDisponibles = pizza.ingredientesParaPizza()
        self.tablaIngredientes.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.siguienteButton.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Funcion requerida para la utilización de UITableView: indica el número de filas que aparecerán en la tabla
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let ingredientes = self.pizza.ingredientesParaPizza()
        
        return ingredientes.count
    }
    
    // Funcion requerida para la utilizacion de UITableView: se emplea para inicializar las celdas de la tabla
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tablaIngredientes.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        let ingredientes = self.pizza.ingredientesParaPizza()
        
        cell.textLabel?.text = ingredientes[indexPath.row]
        
        if self.pizza.tieneIngrediente(ingredientes[indexPath.row]) {
            cell.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 5/255.0, alpha: 1)
        }else{
             cell.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        }
        
        let ingredientesSeleccionados : Int = self.pizza.totalIngredientes()
        let ingredientesRestantes : Int = self.maximoIngredientes - ingredientesSeleccionados
        
        self.seleccionadosLabel.text = "Selecionados: \(String(ingredientesSeleccionados))"
        self.restantesLabel.text = "Restantes: \(String(ingredientesRestantes))"
        
        if(ingredientesSeleccionados>0){
            self.siguienteButton.hidden = false
        }else{
            self.siguienteButton.hidden = true
        }
        
        return cell
    }
    
    // Funcion requerida para la utilizacion de UITableView: se emplea para realizar una acción al seleccionar una de las celdas
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let ingredienteSeleccionado : String = (self.tablaIngredientes.cellForRowAtIndexPath(indexPath)?.textLabel?.text!)!
        if self.pizza.tieneIngrediente(ingredienteSeleccionado) {
            self.pizza.quitarIngrediente(ingredienteSeleccionado)
            self.tablaIngredientes.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        }else{
            if(self.pizza.totalIngredientes() < self.maximoIngredientes){
                self.pizza.añadirIngrediente(ingredienteSeleccionado)
                self.tablaIngredientes.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 5/255.0, alpha: 1)
            }
        }
        
        let ingredientesSeleccionados : Int = self.pizza.totalIngredientes()
        let ingredientesRestantes : Int = self.maximoIngredientes - ingredientesSeleccionados
        
        self.seleccionadosLabel.text = "Selecionados: \(String(ingredientesSeleccionados))"
        self.restantesLabel.text = "Restantes: \(String(ingredientesRestantes))"
        
        if(ingredientesSeleccionados>0){
            self.siguienteButton.hidden = false
        }else{
            self.siguienteButton.hidden = true
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! ConfirmarPizza
        sigVista.pizza = self.pizza
    }


}
