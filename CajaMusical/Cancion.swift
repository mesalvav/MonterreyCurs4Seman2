//
//  Cancion.swift
//  CajaMusical
//
//  Created by Mario E Salvatierra V on 7/31/16.
//  Copyright © 2016 Dunas. All rights reserved.
//

import Foundation

struct Cancion {
    var TituloCancion: String
    var PortadaFileName: String
    private var SonidoFileName: String
    
    init(portada:String, sonido:String, tituloCancion:String) {
        TituloCancion =  tituloCancion
        PortadaFileName = portada
        SonidoFileName = sonido
    }
    
    func sonidoURL() -> NSURL? {
        return NSBundle.mainBundle().URLForResource(SonidoFileName, withExtension: "mp3")
    }
    
}

struct Canciones {
    let lista = [
            Cancion(portada: "PhilAgainstAllOdds.jpg", sonido: "AgainstAllOddsPhil", tituloCancion: "Against All Odds"),
            Cancion(portada: "LennyAmericanWoman.jpg", sonido: "AmericanWomanLenny", tituloCancion: "American Woman"),
            Cancion(portada: "BelieveCher.jpg", sonido: "BelieveCher", tituloCancion: "Believe"),
            Cancion(portada: "BuffaloSoldierMarley.jpg", sonido: "BufaloSoldier", tituloCancion: "Buffalo Soldier"),
            Cancion(portada: "TotoAfrica.jpg", sonido: "totoAfrica", tituloCancion: "Africa")
    ]
}

