//
//  Response.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import Networking
import Foundation

struct Response:  Codable, Hashable {
    
    let results: [Person]
    
    init(
        results: [Person] = []
    ) {
        self.results = results
    }
}


extension Response: NetworkingJSONDecodable {}
