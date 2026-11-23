//
//  controlador_hogar.swift
//  Navegador
//
//  Created by alumno on 11/6/26.
//

import SwiftUI

struct ControladorHogar: View {
    @Environment(MensajesControl.self) var mensajeria
    var body: some View {
        TabView {
            Tab("Biografia", systemImage:  "person.fill"){
                creacionPantalla()
            }
            
            Tab("Altar", systemImage:  "camera.fill"){
                PantallaAR()
            }
            
            Tab("Discografia", systemImage:  "music.pages.fill"){
                ConversacionesControlVista()
            }
            .badge(mensajeria.conversaciones.count)
            
            Tab("Salud", systemImage:  "brain.head.profile.fill"){
                VistaSaludMental()
            }
            
        }
        .tint(.primary)
    }
}


#Preview {
    ControladorHogar()
        .environment(MensajesControl())
        .environment(Controlador())
}
