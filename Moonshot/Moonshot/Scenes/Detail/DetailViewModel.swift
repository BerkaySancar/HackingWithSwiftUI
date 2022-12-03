//
//  DetailViewModel.swift
//  Moonshot
//
//  Created by Berkay Sancar on 3.12.2022.
//

import Foundation

struct DetailViewModel {
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
