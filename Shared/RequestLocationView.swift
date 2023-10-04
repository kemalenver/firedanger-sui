//
//  RequestLocationView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 8/9/2023.
//

import SwiftUI

struct RequestLocationView: View {
    var body: some View {
        VStack {
            Image("flame")
                .resizable()
                .frame(width: 68, height: 78)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .background(Color.black)
            Spacer()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .background(Color.black)
    }
}

#Preview {
    RequestLocationView()
}
