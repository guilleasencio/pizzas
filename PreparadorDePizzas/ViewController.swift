//
//  ViewController.swift
//  PreparadorDePizzas
//
//  Created by Guillermo Asencio Sanchez on 30/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pizza : Pizza = Pizza()
    var mostrarAlerta : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true);
        if self.mostrarAlerta {
            // Mostraremos una alerta en caso de que el usuario pulse confirmar pedido
            let alerta = UIAlertController(title: "Pedido Confirmado", message: "Su pedido ha sido confirmado. En breve se lo enviaremos a casa. ¡Gracias!", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            alerta.addAction(UIAlertAction(title: "Salir" , style: UIAlertActionStyle.Default ,handler: {alerAction in
                print("Pulsado el boton de Salir")
            }))
            
            //Para hacer que la alerta se muestre usamos presentViewController, a diferencia de Objective C que como recordaremos se usa [Show Alerta]
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        self.mostrarAlerta = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! TamanoDePizza
        sigVista.pizza = Pizza()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

