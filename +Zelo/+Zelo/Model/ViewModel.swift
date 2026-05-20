//
//  ViewModel.swift
//  +Zelo
//
//  Created by Turma01-7 on 18/05/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
    
    @Published var medicamentos: [Medicament] = []
    @Published var especialidades: [Specialties] = []
    @Published var vacinas: [Vaccine] = []
    @Published var usuarios: [User] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch() {
        guard let url1 = URL(string: "http://192.168.128.122:1880/verMedicament") else{
            return
        }
        service.fetchHP(url: url1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) { item in
                self.medicamentos = item
            }
            .store(in: &cancellables)
        
        
        guard let url2 = URL(string: "http://192.168.128.122:1880/verSpecialties") else{
            return
        }
        service.fetchHP(url: url2)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) { item in
                self.especialidades = item
            }
            .store(in: &cancellables)
        
        guard let url3 = URL(string: "http://192.168.128.122:1880/verVaccine") else{
            return
        }
        service.fetchHP(url: url3)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) { item in
                self.vacinas = item
            }
            .store(in: &cancellables)
        
        
        guard let url4 = URL(string: "http://192.168.128.122:1880/verUser") else{
            return
        }
        service.fetchHP(url: url4)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { teste in
                print(teste)
            }) { item in
                self.usuarios = item
            }
            .store(in: &cancellables)
    }
}
