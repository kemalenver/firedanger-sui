//
//  InformationView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 21/8/2023.
//

import SwiftUI

struct InformationView: View {
    
    @State private var tabSelection = 0
    
    var todayUnderLineTont: Color {
        return tabSelection == 0 ? Color("darkTint") : .clear
    }
    
    var tomorrowUnderLineTont: Color {
        return tabSelection == 1 ? Color("darkTint") : .clear
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(alignment: .center, spacing: 0) {
                VStack {
                    Button("Danger Ratings") {
                        tabSelection = 0
                    }
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.clear)
                    .foregroundColor(Color("darkTint"))
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(todayUnderLineTont)
                        .padding(0)
                }
                
                VStack {
                    Button("Fire Ban Rules") {
                        tabSelection = 1
                    }
                    .frame(width: geometry.size.width / 2, height: 50)
                    .foregroundColor(Color("darkTint"))
                    .background(Color.clear)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(tomorrowUnderLineTont)
                        .padding(0)
                }
            }
        }
        .frame(height: 52)
        
        
        TabView(selection: $tabSelection) {
            WebView(url: URL(string: Configuration.fireDangerRatingURL)!).tag(0)
            WebView(url: URL(string: Configuration.rulesURL)!).tag(1)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .ignoresSafeArea()
    }
    
}

