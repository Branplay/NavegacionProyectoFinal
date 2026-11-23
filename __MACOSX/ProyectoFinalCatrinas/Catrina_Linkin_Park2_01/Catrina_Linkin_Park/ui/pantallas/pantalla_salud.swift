//
//  configuracion_pantalla.swift
//  Navegador
//
//  Created by alumno on 11/6/26.
//

import SwiftUI

struct VistaSaludMental: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Encabezado empático
                    VStack(alignment: .leading, spacing: 10) {
                        Text("No tienes que cargar con todo en silencio.")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        
                        Text("La historia de Chester nos recordó que incluso las voces más fuertes pueden librar batallas internas silenciosas. Pedir ayuda es un acto de valentía.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                    }
                    .padding(.top, 8)
                    
                    // Organismo: Ejercicio interactivo de respiración
                    TarjetaEjercicioRespiracion()
                    
                    // Organismo: Directorio de ayuda inmediata
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Ayuda inmediata y confidencial")
                            .font(.title3.bold())
                        
                        ForEach(LineaDeAyuda.recursos) { linea in
                            TarjetaLineaAyuda(linea: linea)
                        }
                    }
                    
                    // Nota sobre el legado de 320 Changes Direction
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.text.square.fill")
                                .foregroundColor(.teal)
                            Text("320 Changes Direction")
                                .font(.footnote.bold())
                        }
                        
                        Text("Iniciativa fundada por Talinda Bennington para cambiar la cultura alrededor de la salud mental y reconocer las cinco señales de alerta emocional.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.teal.opacity(0.08))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Salud Mental")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    VistaSaludMental()
        .preferredColorScheme(.dark)
}
