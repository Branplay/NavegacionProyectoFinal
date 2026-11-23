//
//  controlador.swift
//  Catrina_Linkin_Park
//
//  Created by alumno on 10/16/26.
//

import RealityKit
import SwiftUI
import linkin_ar_modelos

@Observable
class Controlador{
    private(set) var estado: EstadosControlador = .cargando
    private(set) var escena: Entity = Entity()
    
    // propiedad para almacenar la biografía activa
        private(set) var biografiaActiva: String? = nil
    
        private(set) var lucesEncendidas: Bool = true
        private var lucesEntities: [Entity] = []
    
    // aquí creamos el mapa: "Nombre Fijo del Modelo" : "NombreDeLaCancion.mp3"
        private let cancionesPorModelo: [String: String] = [
            "Papercut": "Papercut.mp3",
            "Minutes": "Bleed_It_Out.mp3",
            "Reanimation": "PtsOf",
            "Meteora": "Somewhere",
            "CatrinaConVestido": "Sorry",
            "Linkin_park_chester_bennington_2_":"One"
            
        ]
    
        private let biografiasPorModelo: [String: String] = [
            "Linkin_park_chester_bennington_2_": "Voz icónica, inconfundible y alma de Linkin Park, Chester Bennington canalizó el dolor, la vulnerabilidad y la furia juvenil en himnos que marcaron a toda una generación. Su capacidad para pasar de un susurro desgarrador a un grito gutural visceral convirtió a discos como Hybrid Theory y Meteora en fenómenos globales. Más allá de los escenarios, Chester fue un defensor incansable de la salud mental y un artista que transformó su propia lucha interior en un refugio para millones de personas alrededor del mundo. Su legado vive eternamente en cada nota y en el corazón de su comunidad.",
        ]
    
    private var reproductorAudio: AudioPlaybackController?
    
    init(){
        escena.name = "raiz"
        Task.detached(priority: .high) {
            await self.carga_asincrona()
        }
    }
    
    func carga_asincrona() async {
        defer{
            estado = .en_inicio
        }
        let imagen = AnchorEntity(.image(group: "ar", name: "Chester_B"))
        
        guard let modelo = try? await Entity(named: "EscenarioPrincipal", in: linkin_ar_modelosBundle) else {
            fatalError("Modelo no encontrado")
        }
        
                self.buscarLuces(en: modelo)
        
        
        imagen.addChild(modelo)
        escena.addChild(imagen)
        
        
    }

        private func buscarLuces(en entidad: Entity) {
            if entidad.components.has(PointLightComponent.self) ||
               entidad.components.has(SpotLightComponent.self) ||
               entidad.components.has(DirectionalLightComponent.self) {
                lucesEntities.append(entidad)
            }
            for hijo in entidad.children {
                buscarLuces(en: hijo)
            }
        }
        
        func alternar_luces() {
            lucesEncendidas.toggle()
            for luz in lucesEntities {
                luz.isEnabled = lucesEncendidas
            }
            print(lucesEncendidas ? "Luces encendidas" : "Luces apagadas")
        }
    
    func tocaron_a(_ entidad: Entity) {
            print("Modelo presionado: \(entidad.name)")
        
        if let primeraAnimacion = entidad.availableAnimations.first {
                    entidad.playAnimation(primeraAnimacion)
                    print("Reproduciendo animación en: \(entidad.name)")
                } else {

                    for descuidato in entidad.children {
                        if let animacionHijo = descuidato.availableAnimations.first {
                            descuidato.playAnimation(animacionHijo)
                            break
                        }
                    }
                }
        

                let modelosExcluidos = ["CatrinaConVestido", "Linkin_park_chester_bennington_2_"]
                
                if !modelosExcluidos.contains(entidad.name) {
                    let anguloGiro = simd_quatf(angle: .pi, axis: [0, 0, 1])
                    let nuevaOrientacion = entidad.orientation * anguloGiro
                    
                    entidad.move(
                        to: Transform(scale: entidad.scale, rotation: nuevaOrientacion, translation: entidad.position),
                        relativeTo: entidad.parent,
                        duration: 0.5,
                        timingFunction: .easeInOut
                    )
                    print("Girando modelo: \(entidad.name)")
                } else {
                    print("Modelo excluido del giro: \(entidad.name)")
                }
            
            // verificamos si la entidad presionada está en nuestro diccionario de discos
            if let nombreCancion = cancionesPorModelo[entidad.name] {
                
                // esto detiene un audio anterior en caso de que se este reproduciendo
                if let reproductor = reproductorAudio {
                    reproductor.stop()
                    reproductorAudio = nil
                }
                
                // se reporudce la canción correspondiente de forma dinámica
                do {
                    let audioResource = try AudioFileResource.load(named: nombreCancion, in: .main)
                    reproductorAudio = entidad.playAudio(audioResource)
                    print("Reproduciendo canción: \(nombreCancion) desde el modelo: \(entidad.name)")
                } catch {
                    print("Error al cargar el audio \(nombreCancion): \(error.localizedDescription)")
                }
                
            } else {
                print("Este modelo no tiene una canción asignada.")
            }

                if let biografia = biografiasPorModelo[entidad.name] {
                    biografiaActiva = biografia
                    print("Mostrando biografía para: \(entidad.name)")
                }
        }
    // función para cerrar la tarjeta de biografía
        func cerrar_biografia() {
            biografiaActiva = nil
        }
    
    // función para pausar el audio actual
        func pausar_musica() {
            if let reproductor = reproductorAudio {
                reproductor.pause()
                print("Música pausada")
            }
        }
        
        // funcion para reanudar la musica
        func reanudar_musica() {
            if let reproductor = reproductorAudio {
                reproductor.play()
                print("Música reanudada")
            }
        }
    }




enum EstadosControlador{
    case cargando
    case en_inicio
}
