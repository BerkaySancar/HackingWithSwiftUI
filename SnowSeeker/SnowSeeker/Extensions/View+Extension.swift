//
//  View+Extension.swift
//  SnowSeeker
//
//  Created by Berkay Sancar on 24.12.2022.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
