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
                    
                    Button {
                        tabSelection = 0
                    } label: {
                        Text("button_title_danger_ratings")
                            .frame(width: geometry.size.width / 2, height: 50)
                            .background(Color.clear)
                            .foregroundColor(Color("darkTint"))
                    }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(todayUnderLineTont)
                        .padding(0)
                }
                
                VStack {
                    
                    Button {
                        tabSelection = 1
                    } label: {
                        Text("button_title_fire_ban_rules")
                            .frame(width: geometry.size.width / 2, height: 50)
                            .background(Color.clear)
                            .foregroundColor(Color("darkTint"))
                    }
                    
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
