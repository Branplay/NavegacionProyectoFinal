//
//  estilo_respiracion.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/20/26.
//

import SwiftUI

// Estilo para el ícono central dentro del círculo de respiración
struct EstiloIconoRespiracion: ViewModifier {
    var color: Color = .teal

    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundColor(color)
    }
}

// Estilo de contenedor para tarjetas de ejercicio / sección
struct EstiloTarjetaEjercicio: ViewModifier {
    var radioEsquina: CGFloat = 16
    var relleno: CGFloat = 20

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(relleno)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(radioEsquina)
    }
}

extension View {
    func estiloIconoRespiracion(color: Color = .teal) -> some View {
        modifier(EstiloIconoRespiracion(color: color))
    }

    func estiloTarjetaEjercicio(radioEsquina: CGFloat = 16, relleno: CGFloat = 20) -> some View {
        modifier(EstiloTarjetaEjercicio(radioEsquina: radioEsquina, relleno: relleno))
    }
}
