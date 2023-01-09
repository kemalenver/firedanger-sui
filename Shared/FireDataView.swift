//
//  FireDataView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 24/8/2022.
//

import SwiftUI

struct FireDataView: View {
    
    @State var forecastModel: ForecastModel
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 64) {
                
                ZStack(alignment: .center) {
                    Image("flame")
                        .resizable()
                        .frame(width: 68, height: 78)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(forecastModel.tintColor())
                    
                    if forecastModel.banIconVisible() {
                        Image("crossout")
                            .resizable()
                            .frame(width: 141, height: 141)
                            .foregroundColor(forecastModel.tintColor())
                    }
                }
                
                VStack(spacing: 8.0) {
                    Text(forecastModel.fireBanText())
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(forecastModel.tintColor())
                    HStack {
                        Text(forecastModel.fireDangerText())
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(forecastModel.tintColor())
                        Button {
                            
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .tint(forecastModel.tintColor())
                        }
                    }
                }
            }
            
            Spacer()
            
            VStack(spacing: 24.0) {
                
                VStack(spacing: 8.0) {
                    Image("location-pin")
                        .renderingMode(.template)
                        .foregroundColor(forecastModel.tintColor())
                    Text(forecastModel.locationText())
                        .font(.callout)
                        .foregroundColor(forecastModel.tintColor())
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
        .background(forecastModel.backgroundColor())
    }
}

//struct FireDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        FireDataView(manager: self.mana )
//    }
//}
