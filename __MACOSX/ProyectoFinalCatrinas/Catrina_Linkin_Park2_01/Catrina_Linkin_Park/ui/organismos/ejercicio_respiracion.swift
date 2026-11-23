//
//  ejercicio_respiracion.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/18/26.
//

import SwiftUI

struct TarjetaEjercicioRespiracion: View {
    @State private var estaRespirando = false
    @State private var textoFase = "Toca para iniciar ejercicio de calma"
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Tómate un respiro")
                .font(.headline)
            
            ZStack {
                Circle()
                    .fill(Color.teal.opacity(0.15))
                    .frame(width: estaRespirando ? 140 : 80, height: estaRespirando ? 140 : 80)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: estaRespirando)
                
                Circle()
                    .stroke(Color.teal, lineWidth: 2)
                    .frame(width: 80, height: 80)
                
                Image(systemName: "wind")
                    .estiloIconoRespiracion()
            }
            .frame(height: 150)
            .onTapGesture {
                estaRespirando.toggle()
                textoFase = estaRespirando ? "Inhala al expandir... Exhala al contraer" : "Toca para iniciar ejercicio de calma"
            }
            
            Text(textoFase)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .estiloTarjetaEjercicio()
    }
}
