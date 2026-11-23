//
//  boton_emergencia.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/18/26.
//

import SwiftUI

struct BotonLlamadaEmergencia: View {
    let titulo: String
    let iconoSistema: String
    let urlAccion: String
    let esPrincipal: Bool
    
    var body: some View {
        Button(action: ejecutarAccion) {
            HStack(spacing: 8) {
                Image(systemName: iconoSistema)
                    .font(.subheadline.bold())
                Text(titulo)
                    .font(.subheadline.bold())
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(esPrincipal ? Color.teal : Color.secondary.opacity(0.15))
            .foregroundColor(esPrincipal ? .black : .primary)
            .cornerRadius(12)
        }
    }
    
    private func ejecutarAccion() {
        if let url = URL(string: urlAccion), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
