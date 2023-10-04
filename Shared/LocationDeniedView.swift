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
            Image(.flame)
                .resizable()
                .foregroundColor(Color("loadingTint"))
                .frame(width: 68, height: 78)
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 16) {
                Text("location_denied_previously_title")
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                
                    .foregroundColor(Color("darkTint"))
                
                Text("location_denied_previously")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(Color("darkTint"))
            }.padding(8)
            
            Button(action: openSettings) {
                Label("open_settings", systemImage: "gear").font(.title3).foregroundColor(Color("darkTint"))
            }.tint(Color("darkTint"))
            
            Spacer()
        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(Color("lightTint"))
    }
    
    private func openSettings() {
        openURL(URL(string: UIApplication.openSettingsURLString)!)
    }
}

#Preview {
    LocationDeniedView()
}
