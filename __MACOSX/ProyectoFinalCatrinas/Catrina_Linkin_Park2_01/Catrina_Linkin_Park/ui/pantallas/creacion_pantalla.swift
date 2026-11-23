//
//  creacion_pantalla.swift
//  Navegador
//
//  Created by alumno on 11/6/26.
//

import SwiftUI

struct creacionPantalla: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                
                // primera imagen
                VStack(spacing: 12) {
                    Image("chesterBiografia")
                        .estiloImagenEncuadrada(
                            alto: 280,
                            desplazamientoY: 90,
                            radioEsquina: 16
                        )
                        .overlay(
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.6)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                    VStack(spacing: 4) {
                        Text("Chester Bennington")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                        
                        Text("1976 – 2017")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Voz de Linkin Park")
                            .estiloEtiquetaRol()
                    }
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                // biografia
                VStack(alignment: .leading, spacing: 16) {
                    Text("Inicios y Éxito Global")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack(alignment: .top, spacing: 16) {
                        Image("chesterExito")
                            .estiloImagenEncuadrada(
                                ancho: 100,
                                alto: 200,
                                radioEsquina: 12
                            )
                        
                        Text("Desde Phoenix hasta la cima del mundo. Tras años de perseverancia en la escena local, su llegada a Linkin Park en el año 2000 redefinió el rock moderno con *Hybrid Theory*, convirtiendo el dolor y la honestidad en himnos generacionales.")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                // musica
                VStack(alignment: .leading, spacing: 16) {
                    Text("Evolución Musical")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        TimelineRow(year: "2003", title: "Meteora", description: "Consolidación global en la cima del rock.")
                        TimelineRow(year: "2009", title: "Dead by Sunrise", description: "Exploración del post-grunge y rock alternativo.")
                        TimelineRow(year: "2013", title: "Stone Temple Pilots", description: "Cumpliendo su sueño de infancia como vocalista invitado.")
                    }
                    
                    Image("linkinParkBand")
                        .estiloImagenEncuadrada(
                            alto: 180,
                            desplazamientoY: 30,
                            radioEsquina: 12
                        )
                        .padding(.top, 8)
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                // pie de pagina, salud mental
                VStack(alignment: .leading, spacing: 8) {
                    Text("Legado e Impacto")
                        .font(.headline)
                    
                    Text("Más allá de su inigualable rango vocal, Chester dejó un legado imborrable al abrir la conversación sobre la salud mental, enseñándonos que la vulnerabilidad es una forma de valentía.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .estiloTarjetaLegado()
                
            }
            .padding(20)
        }
        .navigationTitle("Biografía")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Componente auxiliar minimalista para la línea de tiempo
struct TimelineRow: View {
    let year: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text(year)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .frame(width: 45, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    creacionPantalla()
}
