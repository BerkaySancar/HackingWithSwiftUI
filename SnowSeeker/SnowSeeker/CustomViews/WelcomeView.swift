//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Berkay Sancar on 20.12.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome SnowSeeker!")
                .font(.largeTitle)
            
            Text ("Please select resort from the left-hand menu. (Swipe from the left to show it...)")
                .font(.subheadline)
                .padding()
                .overlay(Capsule()
                    .stroke(.black, lineWidth: 1))
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
