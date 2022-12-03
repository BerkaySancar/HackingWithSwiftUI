//
//  AstronautDetailView.swift
//  Moonshot
//
//  Created by Berkay Sancar on 3.12.2022.
//

import SwiftUI

struct AstronautDetailView: View {
    
    private var viewModel: AstronautDetailViewModel
    
    init(viewModel: AstronautDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(viewModel.astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(viewModel.astronaut.name)
                    .padding()
                    .font(.headline)
                
                Text(viewModel.astronaut.description)
                    .padding()
                    
            }
        }
        .background(.darkBackground)
        .navigationTitle(viewModel.astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let astronaut = Astronaut(id: "grissom", name: "Virgil I. \"Gus\" Grissom", description: "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor.")
        AstronautDetailView(viewModel: AstronautDetailViewModel(astronaut: astronaut))
    }
}
