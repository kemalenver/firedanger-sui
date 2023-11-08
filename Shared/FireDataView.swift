//
//  FireDataView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 24/8/2022.
//

import SwiftUI

struct FireDataView: View {
    
    var forecastModel: NSWForecastModel

    var body: some View {
        
        VStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 64) {
                FireBanView(forecastModel: forecastModel)
                FireBanDescriptionView(forecastModel: forecastModel)
            }.padding(.top, 48)
            
            Spacer()
            
            VStack(spacing: 24.0) {
                
                VStack(spacing: 8.0) {
                    Image(.locationPin)
                        .renderingMode(.template)
                        .foregroundColor(forecastModel.tintColor())
                    Text(forecastModel.locationText())
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(forecastModel.tintColor())
                }
                
                Banner(bannerID: Configuration.bannerID(), width: Configuration.advertWidth).padding(.bottom, 16)
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(forecastModel.backgroundColor())
    }
}

struct FireBanView: View {
    
    var forecastModel: NSWForecastModel
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(.flame)
                .resizable()
                .frame(width: 68, height: 78)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(forecastModel.tintColor())
            
            if forecastModel.banIconVisible() {
                Image(.crossout)
                    .resizable()
                    .frame(width: 141, height: 141)
                    .foregroundColor(forecastModel.tintColor())
            }
        }.frame(width: 141, height: 141)
    }
}

struct FireBanDescriptionView: View {
    
    var forecastModel: NSWForecastModel
    
    @State private var isPresentWebView = false

    var body: some View {
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
                    isPresentWebView = true
                } label: {
                    Image(systemName: "info.circle.fill")
                        .tint(forecastModel.tintColor())
                }
                .sheet(isPresented: $isPresentWebView) {
                    InformationView()
                }
            }
        }
    }
}
