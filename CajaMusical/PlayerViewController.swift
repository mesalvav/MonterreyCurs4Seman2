//
//  PlayerViewController.swift
//  CajaMusical
//
//  Created by Mario E Salvatierra V on 7/31/16.
//  Copyright © 2016 Dunas. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    var cancionSeleccionada = 0
    let canciones = Canciones()
    private var reproductor: AVAudioPlayer!
    @IBOutlet weak var elTitulo: UILabel!
    
    @IBAction func onSlider(sender: UISlider) {
        let nuevoValor = sender.value
        reproductor.volume = nuevoValor
    }
    
    
    @IBAction func onShuffle(sender: UIButton) {
        reproducirShuffle()
    }
    
    @IBAction func onStop(sender: UIButton) {
        if reproductor.playing {
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
        
    }
    @IBOutlet weak var imagenView: UIImageView!
    
    @IBAction func onPlay(sender: UIButton) {
        if !reproductor.playing {
            reproductor.play()
        }
    }
    
    @IBAction func onPause(sender: UIButton) {
        if reproductor.playing {
            reproductor.pause()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(cancionSeleccionada)
        
        
    }
    override func viewWillAppear(animated: Bool) {
       
        reproducirLa(cancionSeleccionada)
          }
    
    func reproducirLa(Seleccionada: Int) {
        let titulox = canciones.lista[Seleccionada].TituloCancion
        elTitulo.text = titulox
        
        let portadax = canciones.lista[Seleccionada].PortadaFileName
        if let image = UIImage(named: portadax) {
            imagenView.image = image
        }
        
        do {
            let cancionURL = canciones.lista[Seleccionada].sonidoURL()
            try reproductor = AVAudioPlayer(contentsOfURL: cancionURL!)
            reproductor.play()
            reproductor.volume = 0.5
        } catch { print("error no cargo sonido")}
        
        
    }
    
    func reproducirShuffle() {
        let tamanoDeLista = uint(canciones.lista.count)
        let aleatorio = Int(arc4random_uniform(tamanoDeLista))
        reproducirLa(aleatorio)
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
