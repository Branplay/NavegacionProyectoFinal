//
//  linea_de_ayuda.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 11/18/26.
//


import SwiftUI
import Foundation

struct LineaDeAyuda: Identifiable {
    let id = UUID()
    let titulo: String
    let descripcion: String
    let numeroTelefono: String
    let numeroMensaje: String?
    let region: String
    let esPrincipal: Bool
}

extension LineaDeAyuda {
    static let recursos: [LineaDeAyuda] = [
        LineaDeAyuda(
            titulo: "Línea de la Vida (México)",
            descripcion: "Atención psicológica y crisis emocional 24/7, gratuita y confidencial.",
            numeroTelefono: "8009112000",
            numeroMensaje: nil,
            region: "México",
            esPrincipal: true
        ),
        LineaDeAyuda(
            titulo: "Prevención del suicidio",
            descripcion: "El suicidio es un importante problema de salud pública que aún está rodeado de estigma, mitos y tabúes. Cada suicidio es una tragedia que afecta no solo a las personas, sino también a sus familias y comunidades. En 2021, se estima que 727.000 personas en todo el mundo perdieron la vida por suicidio. La Región de las Américas es la única Región de la OMS donde las tasas de suicidio han aumentado. El quinto informe regional, Suicidio en las Américas (septiembre de 2025), ofrece los datos epidemiológicos más actualizados sobre suicidio para todos los países y subregiones, brindando información valiosa para afrontar este desafío.",
            numeroTelefono: "",
            numeroMensaje: "",
            region: "Global",
            esPrincipal: false
        ),
        LineaDeAyuda(
            titulo: "Línea de Texto en Crisis",
            descripcion: "Envía 'AYUDA' o 'HOLA' para conectar con un consejero por mensaje de texto.",
            numeroTelefono: "",
            numeroMensaje: "741741",
            region: "SMS 24/7",
            esPrincipal: false
        )
    ]
}
