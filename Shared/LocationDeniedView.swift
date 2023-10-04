//
//  LocationDeniedView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 8/9/2023.
//

import SwiftUI

struct LocationDeniedView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(spacing: 16) {
            Image("flame")
                .resizable()
                .frame(width: 68, height: 78)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
            
            Text("Location permissions were previously denied. Please go to the settings app and give permission.")
            
            Button(action: openSettings) {
                Label("Open Settings", systemImage: "gear")
            }.tint(Color.black)
            
            Spacer()
        }
    }
    
    private func openSettings() {
        openURL(URL(string: UIApplication.openSettingsURLString)!)
    }
}

#Preview {
    LocationDeniedView()
}
