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
            Image(.flame)
                .resizable()
                .foregroundColor(Color("loadingTint"))
                .frame(width: 68, height: 78)
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

#Preview {
    RequestLocationView()
}
