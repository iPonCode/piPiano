//
//  ViewController.swift
//  piPiano
//
//  Created by superw on 07/12/2018.
//  Copyright © 2018 superw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let soundsNames = ["c1","c1s","d1","d1s","e1","f1","f1s","g1","g1s","a1","a1s","b1","c2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //al pulsar el botón (la tecla del piano) y levantar el dedo se ejecutará el código de esta función.
    //para que funcione para todos y cada uno de los botones, una vez hayamos arrastrado con ctrl pulsado el primer botón para dejarlo configurado creando la Action para ese botón, entonces vamos arrastando también con ctrl pulsado cada uno de los botones que queramos (son 13 en total) hasta  esta misma función soltándolos en el código dijándonos bien en que aparezca un mensaje que indica "Connect Action" y NO el de "Insert Action, Outlet.."
    //para comprobar que están hechas las 13 conexiones correspondientes a cada botón o tecla del piano, posicionamos el cursor del ratón encima del número de línea del código correspondiente con la declaración de la función "@IBAction func" (en lugar del núero de línea aparece una bolita con un signo + en el interior) y en el StoryBoard se deben marcar todos los elementos conectados.
    @IBAction func TouchUpInsidePlay(_ sender: UIButton) {
        let tagKeyPressed = sender.tag
        let fileName = soundsNames[tagKeyPressed - 1]
        print("-> Se ha SOLTADO la tecla >>> \(tagKeyPressed) <<< >>> \(fileName)")
    }
    
    @IBAction func TouchDownPlay(_ sender: UIButton) {
        /*let tagKeyPressed = sender.tag
        let fileName = soundsNames[tagKeyPressed - 1]
        print("-> Se ha PULSADO la tecla >>> \(tagKeyPressed) <<< >>> \(fileName)")*/
    }
}

