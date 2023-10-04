//
//  FindingLocationView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 9/1/2023.
//

import SwiftUI

struct FindingLocationView: View {
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 64) {
                ZStack(alignment: .center) {
                    Image(.flame)
                        .resizable()
                        .frame(width: 68, height: 78)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("loadingTint"))
                }
            }
            
            Spacer()
            
            VStack(spacing: 24.0) {
                VStack(spacing: 8.0) {
                    Image(.locationPin)
                        .renderingMode(.template)
                        .foregroundColor(Color("loadingTint"))
                    Text("fetching_location")
                        .font(.callout)
                        .foregroundColor(Color("loadingTint"))
                }
                
                Banner(bannerID: Configuration.bannerID(), width: Configuration.advertWidth)
                
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

#Preview {
    FindingLocationView()
}
