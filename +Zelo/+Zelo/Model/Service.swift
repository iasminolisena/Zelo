//
//  Service.swift
//  +Zelo
//
//  Created by Turma01-7 on 18/05/26.
//

import Foundation
import Combine

struct Service{
    func fetchHP(url: URL) -> AnyPublisher<[Medicament], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Medicament].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func fetchHP(url: URL) -> AnyPublisher<[Specialties], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Specialties].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchHP(url: URL) -> AnyPublisher<[Vaccine], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Vaccine].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchHP(url: URL) -> AnyPublisher<[User], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
