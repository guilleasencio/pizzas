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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! TamanoDePizza
        sigVista.pizza = self.pizza
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

