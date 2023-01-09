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
                    Image("flame")
                        .resizable()
                        .frame(width: 68, height: 78)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("loadingTint"))
                }
            }
            
            Spacer()
            
            VStack(spacing: 24.0) {
                
                VStack(spacing: 8.0) {
                    Image("location-pin")
                        .renderingMode(.template)
                        .foregroundColor(Color("loadingTint"))
                    Text("Getting Location")
                        .font(.callout)
                        .foregroundColor(Color("loadingTint"))
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

struct FindingLocationView_Previews: PreviewProvider {
    static var previews: some View {
        FindingLocationView()
    }
}
