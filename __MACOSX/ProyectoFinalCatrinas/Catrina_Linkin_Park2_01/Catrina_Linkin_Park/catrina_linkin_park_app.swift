//
//  Catrina_Linkin_ParkApp.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 10/12/26.
//

import SwiftUI

@main
struct Catrina_Linkin_ParkApp: App {
    @State var controlador = Controlador()
    @State var controladorMensajes = MensajesControl()
    var body: some Scene {
        WindowGroup {
            ControladorHogar()
                .environment(controlador)
                .environment(controladorMensajes)
        }
    }
}
