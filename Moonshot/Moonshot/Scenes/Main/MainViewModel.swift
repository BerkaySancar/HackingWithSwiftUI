//
//  MainViewModel.swift
//  Moonshot
//
//  Created by Berkay Sancar on 3.12.2022.
//

import Foundation

struct MainViewModel {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
}
