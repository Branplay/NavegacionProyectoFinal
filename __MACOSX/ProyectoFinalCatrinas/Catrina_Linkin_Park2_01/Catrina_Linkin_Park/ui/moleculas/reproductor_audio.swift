import Foundation
import AVFoundation
import Combine

class ReproductorAudio: ObservableObject {
    static let compartido = ReproductorAudio()
    
    private var reproductor: AVAudioPlayer?
    @Published var cancionActual: String? = nil
    @Published var estaReproduciendo: Bool = false
    
    /// Se ejecuta al tocar la tarjeta del mensaje: inicia la canción
    func reproducir(nombreArchivo: String) {
        guard !nombreArchivo.isEmpty else { return }
        
        // Si ya es la canción actual y está pausada, simplemente reanuda
        if cancionActual == nombreArchivo, !estaReproduciendo {
            reproductor?.play()
            estaReproduciendo = true
            return
        }
        
        // Busca el archivo .mp3 en el proyecto
        guard let url = Bundle.main.url(forResource: nombreArchivo, withExtension: "mp3") else {
            print("No se encontró el archivo de audio: \(nombreArchivo).mp3")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            reproductor = try AVAudioPlayer(contentsOf: url)
            reproductor?.play()
            cancionActual = nombreArchivo
            estaReproduciendo = true
        } catch {
            print("Error al reproducir audio: \(error.localizedDescription)")
        }
    }
    
    /// Se ejecuta al tocar el botón de Pausa/Reanudar
    func alternarPausa() {
        guard let reproductor = reproductor else { return }
        
        if reproductor.isPlaying {
            reproductor.pause()
            estaReproduciendo = false
        } else {
            reproductor.play()
            estaReproduciendo = true
        }
    }
    
    /// Detiene el audio por completo
    func detener() {
        reproductor?.stop()
        cancionActual = nil
        estaReproduciendo = false
    }
}
