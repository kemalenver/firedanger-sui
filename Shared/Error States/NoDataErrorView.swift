//
//  NoDataErrorView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 9/1/2023.
//

import SwiftUI

struct NoDataErrorView: View {
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
                    Text("rfs_data_not_found")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color("darkTint"))
                    HStack {
                        Text("no_data_try_again")
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
                    Button {
                        print("Retry button was tapped")
                    } label: {
                        VStack {
                            Image(.retry)
                                .resizable()
                                .tint(Color("darkTint"))
                                .frame(width: 24, height: 24)
                            Text("retry")
                                .font(.callout)
                                .foregroundColor(Color("darkTint"))
                        }
                    }
                }
                
                Rectangle()
                    .frame(height: 50.0)
                    .foregroundColor(.green)
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

struct NoDataErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataErrorView()
    }
}
