import SwiftUI
import RealityKit

struct PantallaAR: View {
    @Environment(Controlador.self) var control
    
    var body: some View {
        switch control.estado {
        case .cargando:
            Text("Cargando...")
        case .en_inicio:
            ZStack(alignment: .bottom) {
                RealityView { teatro in
                    teatro.camera = .spatialTracking
                    teatro.add(control.escena)
                }
                .gesture(TapGesture().targetedToAnyEntity().onEnded { evento_tap in
                    control.tocaron_a(evento_tap.entity)
                })
                
                VStack {
                    Text("Toca algún objeto para interactuar con él")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial)
                        .foregroundColor(.primary)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .padding(.top, 60) // espacio
                    
                    Spacer()
                }
                
                // biografia
                if let biografia = control.biografiaActiva {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Label("Biografía", systemImage: "book.fill")
                                .font(.headline)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Button(action: {
                                control.cerrar_biografia()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Text(biografia)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(20)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 110)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut, value: control.biografiaActiva != nil)
                }
                
                // botones para pausar la musica
                HStack(spacing: 16) {
                    // Botón de Pausa de Música
                    Button(action: {
                        control.pausar_musica()
                    }) {
                        Label("Pausar", systemImage: "pause.fill")
                            .font(.headline)
                            .padding()
                            .background(.ultraThinMaterial)
                            .foregroundColor(.primary)
                            .cornerRadius(12)
                    }
                    
                    // boton para prender y apagar las luces
                    Button(action: {
                        control.alternar_luces()
                    }) {
                        Label(control.lucesEncendidas ? "Apagar Luces" : "Prender Luces",
                              systemImage: control.lucesEncendidas ? "lightbulb.slash.fill" : "lightbulb.fill")
                            .font(.headline)
                            .padding()
                            .background(.ultraThinMaterial)
                            .foregroundColor(.primary)
                            .cornerRadius(12)
                    }
                }
                .padding(.bottom, 40)
            }
        }
    }
}
