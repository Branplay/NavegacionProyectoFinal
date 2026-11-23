//
//  estilo_biografia.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/20/26.
//

import SwiftUI

// Extensión directa sobre Image para que .resizable() funcione sin errores
extension Image {
    func estiloImagenEncuadrada(
        ancho: CGFloat? = nil,
        alto: CGFloat,
        desplazamientoY: CGFloat = 0,
        radioEsquina: CGFloat = 12
    ) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: ancho, height: alto)
            .offset(y: desplazamientoY)
            .clipped()
            .cornerRadius(radioEsquina)
    }
}

// Estilo de pastilla para etiquetas de rol o subtítulo destacado
struct EstiloEtiquetaRol: ViewModifier {
    var colorFondo: Color = .secondary.opacity(0.2)
    var radioEsquina: CGFloat = 8

    func body(content: Content) -> some View {
        content
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(colorFondo)
            .cornerRadius(radioEsquina)
            .padding(.top, 4)
    }
}

// Estilo de bloque contenedor para secciones finales
struct EstiloTarjetaLegado: ViewModifier {
    var colorFondo: Color = Color(.systemGray6)
    var radioEsquina: CGFloat = 12

    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorFondo)
            .cornerRadius(radioEsquina)
    }
}

extension View {
    func estiloEtiquetaRol(
        colorFondo: Color = .secondary.opacity(0.2),
        radioEsquina: CGFloat = 8
    ) -> some View {
        modifier(EstiloEtiquetaRol(colorFondo: colorFondo, radioEsquina: radioEsquina))
    }

    func estiloTarjetaLegado(
        colorFondo: Color = Color(.systemGray6),
        radioEsquina: CGFloat = 12
    ) -> some View {
        modifier(EstiloTarjetaLegado(colorFondo: colorFondo, radioEsquina: radioEsquina))
    }
}
