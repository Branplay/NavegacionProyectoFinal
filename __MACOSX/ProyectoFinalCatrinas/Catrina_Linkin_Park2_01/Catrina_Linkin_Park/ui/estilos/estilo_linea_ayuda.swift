//
//  estilo_linea_ayuda.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/20/26.
//

import SwiftUI

struct EstiloBadgeRegion: ViewModifier {
    var color: Color = .teal

    func body(content: Content) -> some View {
        content
            .font(.caption2.bold())
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(6)
    }
}

// Estilo de tarjeta agrupada para secciones o fichas informativas
struct EstiloTarjetaAgrupada: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(16)
    }
}

extension View {
    func estiloBadgeRegion(color: Color = .teal) -> some View {
        modifier(EstiloBadgeRegion(color: color))
    }

    func estiloTarjetaAgrupada() -> some View {
        modifier(EstiloTarjetaAgrupada())
    }
}
