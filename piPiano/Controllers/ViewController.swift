//
//  ViewController.swift
//  piPiano
//
//  Created by superw on 07/12/2018.
//  Copyright © 2018 superw. All rights reserved.
//

//Comment for commit and push to remote to say the we was changed the App Icon

import UIKit
import AVFoundation //necesario para reproducir sonido (usaremos un UIAVPlayer)

class ViewController: UIViewController {
    
    //Tendré que crear un AudioPlayer para cada sonido así que necesito una variable
    var audioPlayer : AVAudioPlayer! //es un requerido
    
    let soundsNames = ["c3","c3s","d3","d3s","e3","f3","f3s","g3","g3s","a3","a3s","b3","c4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //al pulsar el botón (la tecla del piano) y levantar el dedo se ejecutará el código de esta función.
    //para que funcione para todos y cada uno de los botones, una vez hayamos arrastrado con ctrl pulsado el primer botón para dejarlo configurado creando la Action para ese botón, entonces vamos arrastando también con ctrl pulsado cada uno de los botones que queramos (son 13 en total) hasta  esta misma función soltándolos en el código dijándonos bien en que aparezca un mensaje que indica "Connect Action" y NO el de "Insert Action, Outlet.."
    //para comprobar que están hechas las 13 conexiones correspondientes a cada botón o tecla del piano, posicionamos el cursor del ratón encima del número de línea del código correspondiente con la declaración de la función "@IBAction func" (en lugar del núero de línea aparece una bolita con un signo + en el interior) y en el StoryBoard se deben marcar todos los elementos conectados.
    @IBAction func TouchUpInsidePlay(_ sender: UIButton) {
        let indexOfKeyPressed = sender.tag - 1
        guard !soundsNames.isEmpty,
              0 <= indexOfKeyPressed,
              indexOfKeyPressed < soundsNames.count else { return }
        let fileName = soundsNames[indexOfKeyPressed]
        print("-> Se ha SOLTADO la tecla >>> con tag: \(sender.tag) <<< >>> nombre: \(fileName)")

        //necestio conocer la URL del archivo en disco que contiene el sonido mp3 que quiero reproducir, utilizo bundle que es una representación en código de todos los recursos en disco de la aplicacion, pasándole el nombre del recurso obtenermos la URL del mismo
        //necesitamos el if-let porque el parámetro del bundle es opcional, así nos aseguramos que si no lo puede obtener por lo que sea no se ejecuta la linea
        if let soundURL : URL = Bundle.main.url(forResource: fileName, withExtension: "wav"){
            print("-> la URL del archivo es:\n >>> \(soundURL) <<< ")
            //le indicamos que haga "do": intenta "try" cargar el sonido de la URL y en caso de que no puedas capturamos el error con "catch"
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                //error no lo he declarado, en el caso del catch se genera automáticamente, la genera el constructor
                print(error)
            }
            audioPlayer.play() //finalmente reproducimos el sonido
        }
    }
    
    @IBAction func TouchDownPlay(_ sender: UIButton) {
        let indexOfKeyPressed = sender.tag - 1
        guard !soundsNames.isEmpty,
              0 <= indexOfKeyPressed,
              indexOfKeyPressed < soundsNames.count else { return }
        let fileName = soundsNames[indexOfKeyPressed]
        print("-> Se ha PULSADO la tecla >>> con tag: \(sender.tag) <<< >>> nombre: \(fileName)")
    }
}

