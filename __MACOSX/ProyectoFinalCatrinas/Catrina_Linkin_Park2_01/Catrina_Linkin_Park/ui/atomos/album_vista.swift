//
//  conversaciones_prevista.swift
//  Navegador
//
//  Created by alumno on 11/6/26.
//

import SwiftUI

struct ConversacionPrevista: View {
    let conversacion: Conversacion
    
    var body: some View {
        HStack(spacing: 12) {
            Image(conversacion.imagen)
                .resizable()
                .estiloAvatarCircular()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Album")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                Text(conversacion.remitente)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                    .lineLimit(1)
            }
            
            Spacer()
        }
        .estiloTarjetaFlotante()
    }
}

#Preview {
    ConversacionPrevista(conversacion: ConversacionesFalsas[0])
        .padding()
}
