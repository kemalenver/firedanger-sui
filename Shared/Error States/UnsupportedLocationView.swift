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
                    Text("location_unsupported_title")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color("darkTint"))
                    HStack {
                        Text("location_unsupported_body")
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
                
                VStack(spacing: 8.0) {
                    Image("location-pin")
                        .renderingMode(.template)
                        .foregroundColor(Color("darkTint"))
                    Text("outside_coverage_area")
                        .font(.callout)
                        .foregroundColor(Color("darkTint"))
                }
                
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
}
