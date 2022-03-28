//
//  API.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import Networking
import Combine

class NetworkSetup {
    
    lazy var network: NetworkingClient = {
        var network = NetworkingClient(baseURL: "https://randomuser.me/api")
        network.timeout = 5
        network.logLevels = .debug
        return network
    }()
    
}

struct API: NetworkingService {
    var network = NetworkSetup().network
    
    func fetch() -> AnyPublisher<Response, Error> {
        get("?results=1000&seed=chalkboard&inc=name,dob")
    }
   
}

