//
//  Person.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import Foundation

struct Person:  Codable, Hashable {
    
    let name: Name
    let dob: DOB
    
    init(
        name: Name? = nil,
        dob: DOB? = nil
    ) {
        self.name = name ?? Name()
        self.dob = dob ?? DOB()
    }
}
