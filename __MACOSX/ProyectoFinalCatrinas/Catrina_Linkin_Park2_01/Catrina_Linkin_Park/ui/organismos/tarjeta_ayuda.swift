import SwiftUI

struct TarjetaLineaAyuda: View {
    let linea: LineaDeAyuda
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(linea.region.uppercased())
                    .estiloBadgeRegion()
                
                Spacer()
                
                if linea.esPrincipal {
                    Label("24/7", systemImage: "clock.fill")
                        .font(.caption2.bold())
                        .foregroundColor(.secondary)
                }
            }
            
            Text(linea.titulo)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(linea.descripcion)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack(spacing: 12) {
                if !linea.numeroTelefono.isEmpty {
                    BotonLlamadaEmergencia(
                        titulo: "Llamar \(linea.numeroTelefono)",
                        iconoSistema: "phone.fill",
                        urlAccion: "tel://\(linea.numeroTelefono)",
                        esPrincipal: linea.esPrincipal
                    )
                }
                
                if let sms = linea.numeroMensaje {
                    BotonLlamadaEmergencia(
                        titulo: "Mensaje",
                        iconoSistema: "message.fill",
                        urlAccion: "sms:\(sms)",
                        esPrincipal: false
                    )
                }
            }
            .padding(.top, 4)
        }
        .estiloTarjetaAgrupada()
    }
}
