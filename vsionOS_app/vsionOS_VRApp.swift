//
//  vsionOS_VRApp.swift
//  vsionOS_VR
//
//  Created by ADL on 2024-01-31.
//

import SwiftUI

@main
struct vsionOS_VRApp: App {
    @State var immersiveMode: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup {
            ImmersiveControllerView()
        }
        .defaultSize(width: 10, height: 10)
        .windowStyle(.plain)
        
        ImmersiveSpace(id: "ImmersiveView") {
            ImmersiveView()
        }
        .immersionStyle(selection: $immersiveMode, in: .full)
    }
}
