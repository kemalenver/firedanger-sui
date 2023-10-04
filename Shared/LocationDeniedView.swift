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
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 64) {
                
                ZStack(alignment: .center) {
                    Image(.warning)
                        .resizable()
                        .frame(width: 72, height: 72)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("darkTint"))
                }
                
                VStack(spacing: 8.0) {
                    Text("location_denied_previously_title")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color("darkTint"))
                    HStack {
                        Text("location_denied_previously")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color("darkTint"))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 16)
            }
            
            Spacer()
            
            VStack(spacing: 24.0) {
                
                Button(action: openSettings) {
                    Label("open_settings", systemImage: "gear").font(.body).foregroundColor(Color("darkTint"))
                }.tint(Color("darkTint"))
                
                Banner(bannerID: Configuration.bannerID(), width: Configuration.advertWidth)
            }
            .padding([.bottom], 16)
        }
        .frame(
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
