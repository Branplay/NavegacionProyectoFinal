//
//  estilo_tarjetas.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/20/26.
//

import SwiftUI

// Estilo para la imagen circular (40x40 + fondo redondo)
struct EstiloAvatarCircular: ViewModifier {
    var tamano: CGFloat = 40

    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.secondary)
            .frame(width: tamano, height: tamano)
            .background(
                Circle()
                    .fill(Color(.tertiarySystemBackground))
            )
            .clipShape(Circle())
    }
}

// Estilo para el contenedor de tarjeta con sombra sutil
struct EstiloTarjetaFlotante: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.secondarySystemBackground))
            )
            .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 4)
    }
}

// Extensiones para llamarlos fácil con un punto (.)
extension View {
    func estiloAvatarCircular(tamano: CGFloat = 40) -> some View {
        modifier(EstiloAvatarCircular(tamano: tamano))
    }

    func estiloTarjetaFlotante() -> some View {
        modifier(EstiloTarjetaFlotante())
    }
}
