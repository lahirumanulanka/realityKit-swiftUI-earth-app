//
//  ImmersiveView.swift
//  vsionOS_VR
//
//  Created by ADL on 2024-01-31.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView{ content in
            guard let skyBoxEntity = createSkyBox() else {
                return
            }
            let eaarthEntity = await createEarthModel()
            content.add(skyBoxEntity)
            content.add(eaarthEntity)
        }
    }
    
    private func createSkyBox () -> Entity? {
        let largeSphere = MeshResource.generateSphere(radius: 1000)
        var skyBoxMeterial = UnlitMaterial()
        do {
            let texture = try TextureResource.load(named: "skynight")
            skyBoxMeterial.color = .init(texture: .init( texture))
        } catch {
            print("error \(error)")
        }
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(ModelComponent(mesh: largeSphere, materials: [skyBoxMeterial]))
        skyBoxEntity.scale *= .init(x: -1, y: 1, z: 1)
        return skyBoxEntity
    }
    
    private func createEarthModel() async -> Entity {
        guard let earthEntity = try? await Entity(named: "Scene", in: realityKitContentBundle) else { fatalError("Cannot load earth model") }
        return earthEntity
    }
}

#Preview {
    ImmersiveView()
}
