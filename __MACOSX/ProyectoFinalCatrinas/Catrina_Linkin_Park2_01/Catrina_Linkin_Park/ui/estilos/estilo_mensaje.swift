//
//  estilo_mensaje.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/20/26.
//

import SwiftUI

struct EstiloTarjetaMensaje: ViewModifier {
    var estaActivo: Bool
    var colorActivo: Color = .teal

    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        estaActivo
                            ? colorActivo.opacity(0.15)
                            : Color(.secondarySystemBackground)
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(
                        estaActivo ? colorActivo : Color.clear,
                        lineWidth: 1.5
                    )
            )
    }
}

// Estilo para el ícono/botón de control de reproducción
struct EstiloBotonReproduccion: ViewModifier {
    var color: Color = .teal

    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(color)
    }
}

extension View {
    func estiloTarjetaMensaje(estaActivo: Bool, colorActivo: Color = .teal) -> some View {
        modifier(EstiloTarjetaMensaje(estaActivo: estaActivo, colorActivo: colorActivo))
    }

    func estiloBotonReproduccion(color: Color = .teal) -> some View {
        modifier(EstiloBotonReproduccion(color: color))
    }
}
