//
//  BirthdayViewModel.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI
import Networking
import Combine

class BirthdayViewModel: ObservableObject {
    
    private let api = API()
    @Published var response: Response = Response()
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch(completion: @escaping (Error?) -> ()){
        let promise = api.fetch()
        PromiseHandler<Response>.fulfill(promise, storedIn: &cancellables) { result in
            switch result {
            case .success(let response):
                self.response = response
                completion(nil)
            case .failure(let err):
                completion(err)
            }
        }
    }
   
}
