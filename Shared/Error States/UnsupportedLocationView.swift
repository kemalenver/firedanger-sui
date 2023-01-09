//
//  UnsupportedLocationView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 9/1/2023.
//

import SwiftUI

struct UnsupportedLocationView: View {

    var body: some View {
        
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 64) {
                
                ZStack(alignment: .center) {
                    Image("warning")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("darkTint"))
                }
                
                VStack(spacing: 8.0) {
                    Text("You're not in NSW")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color("darkTint"))
                    HStack {
                        Text("Fire Danger ratings only works inside NSW, Australia")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color("darkTint"))
                            .multilineTextAlignment(.center)
                    }
                }
            }
            
            Spacer()
            
            VStack(spacing: 24.0) {
                
                VStack(spacing: 8.0) {
                    Image("location-pin")
                        .renderingMode(.template)
                        .foregroundColor(Color("darkTint"))
                    Text("Outside Fire Danger Coverage Area")
                        .font(.callout)
                        .foregroundColor(Color("darkTint"))
                }
                
                Rectangle()
                    .frame(height: 50.0)
                    .foregroundColor(.orange)
            }.padding(.bottom, 16)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(Color("lightTint"))
    }
}
