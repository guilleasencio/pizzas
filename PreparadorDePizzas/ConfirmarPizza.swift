//
//  ConfirmarPizza.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import UIKit

class ConfirmarPizza: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tamañoLabel: UILabel!
    @IBOutlet weak var masaLabel: UILabel!
    @IBOutlet weak var quesoLabel: UILabel!
    
    @IBOutlet weak var ingredientesTable: UITableView!
    
    var pizza: Pizza = Pizza()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ingredientesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tamañoLabel.text = "Tamaño: \(self.pizza.verTamaño())"
        self.masaLabel.text = "Masa: \(self.pizza.verMasa())"
        self.quesoLabel.text = "Queso: \(self.pizza.verQueso())"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Funcion requerida para la utilización de UITableView: indica el número de filas que aparecerán en la tabla
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let ingredientes = self.pizza.verIngredientes()
        
        return ingredientes.count
    }
    
    // Funcion requerida para la utilizacion de UITableView: se emplea para inicializar las celdas de la tabla
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.ingredientesTable.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        let ingredientes = self.pizza.verIngredientes()
        
        cell.textLabel?.text = "- \(ingredientes[indexPath.row])"
        
        return cell
    }

    
//    @IBAction func confirmarPedido(sender: AnyObject) {
//        
//        // Mostraremos una alerta en caso de que el usuario pulse confirmar pedido
//        let alerta = UIAlertController(title: "Pedido Confirmado", message: "Su pedido ha sido confirmado. En breve se lo enviaremos a casa. ¡Gracias!", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        
//        alerta.addAction(UIAlertAction(title: "Salir" , style: UIAlertActionStyle.Default ,handler: {alerAction in
//            print("Pulsado el boton de Salir")
//        }))
//        
//        //Para hacer que la alerta se muestre usamos presentViewController, a diferencia de Objective C que como recordaremos se usa [Show Alerta]
//        
//        self.presentViewController(alerta, animated: true, completion: nil)
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVista = segue.destinationViewController as! ViewController
        sigVista.mostrarAlerta = true

    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
