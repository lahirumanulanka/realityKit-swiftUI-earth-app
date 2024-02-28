//
//  ContentView.swift
//  vsionOS_VR
//
//  Created by ADL on 2024-01-31.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveControllerView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await openImmersiveSpace(id: "ImmersiveView")
                }
            } label: {
                Image(systemName: "visionpro")
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ImmersiveControllerView()
}
