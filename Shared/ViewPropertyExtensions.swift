//
//  ViewPropertyExtensions.swift
//  firedanger-sui (iOS)
//
//  Created by Kemal Enver on 8/11/2023.
//

import SwiftUI

extension View {

    func prefersPersistentSystemOverlaysHidden() -> some View {
        if #available(iOS 16.0, *) {
            return self.persistentSystemOverlays(.hidden)
        } else {
            return self
        }
    }
}
