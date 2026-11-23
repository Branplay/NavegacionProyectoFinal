import SwiftUI

struct MensajeVista: View {
    let mensaje: Mensaje
    @ObservedObject private var reproductor = ReproductorAudio.compartido

    private var esCancionActual: Bool {
        guard let audio = mensaje.archivoAudio, !audio.isEmpty else { return false }
        return reproductor.cancionActual == audio
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Label(
                    mensaje.remitente ?? "Usuario desconocido",
                    systemImage: "music.note"
                )
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)

                Spacer()

                if esCancionActual {
                    Button(action: {
                        reproductor.alternarPausa()
                    }) {
                        Image(
                            systemName: reproductor.estaReproduciendo
                                ? "pause.circle.fill"
                                : "play.circle.fill"
                        )
                        .estiloBotonReproduccion()
                    }
                    .buttonStyle(.plain)
                }
            }

            Divider()
                .overlay(Color(.separator).opacity(0.5))

            Text(mensaje.cuerpo)
                .font(.body)
                .foregroundStyle(.primary)
                .lineSpacing(4)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .estiloTarjetaMensaje(estaActivo: esCancionActual)
        .contentShape(Rectangle())
        .onTapGesture {
            if let audio = mensaje.archivoAudio, !audio.isEmpty {
                reproductor.reproducir(nombreArchivo: audio)
            }
        }
    }
}

#Preview {
    MensajeVista(mensaje: Mensaje(
        remitente: "Pista 01",
        receptor: nil,
        cuerpo: "Papercut",
        archivoAudio: "papercut"
    ))
    .padding()
}
