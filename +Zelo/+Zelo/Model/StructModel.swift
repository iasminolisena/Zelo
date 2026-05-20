//
//  StructModel.swift
//  +Zelo
//
//  Created by Turma01-7 on 18/05/26.
//

import Foundation


import Foundation

struct Specialties: Codable, Hashable {
    let _id: String
    let _rev: String
    let doc_id: String
    let nome: String
}

struct Vaccine: Codable, Hashable {
    let _id: String
    let _rev: String
    let vac_id: String
    let nome: String
}


struct Medicament: Codable, Hashable {
    let _id: String
    let _rev: String
    let med_id: String
    let nome: String
    let tipo: [String]
}

struct User: Codable, Hashable {
    let _id: String
    let _rev: String
    let nomeU: String
    let sobrenome: String
    let idade: Int
    let sexo: String
    let tipoSanguineo: String
    let alergia: String
    let problemaDeSaude: String
    let telefone: String
    let altura: Double
    let peso: Double
    let email: String
    let dataNasc: String
    let routine: Routine
    let consulta: [Consulta]
    let exames: [Exame]
    let medicament: [MedicamentoUsuario]
    let vaccine: [VacinaUsuario]
    let familia: [Familia]
    
    enum CodingKeys: String, CodingKey {
        
        case _id
        case _rev
        case nomeU
        case sobrenome
        case idade
        case sexo
        case tipoSanguineo
        case alergia
        case problemaDeSaude
        case telefone
        case altura
        case peso
        case email
        case dataNasc
        case routine = "Routine"
        case consulta
        case exames
        case medicament = "Medicament"
        case vaccine = "Vaccine"
        case familia
    }
}

struct Routine: Codable, Hashable {
    
    let descricao: String
    let cafeManha: Refeicao
    let lancheM: Refeicao
    let almoco: Refeicao
    let lancheT: Refeicao
    let jantar: Refeicao
    let ceia: Refeicao
}

struct Refeicao: Codable, Hashable {
    let horario: String
    let cardapio: String
}

struct Consulta: Codable, Hashable {
    let doc_id: String
    let especialidade: String
    let medico: String
    let dataC: String
    let local: String
    let dRetorno: String
}

struct Exame: Codable, Hashable {
    let tipo: String
    let data_exame: String
    let laboratorio: String
}

struct MedicamentoUsuario: Codable, Hashable {
    let med_id: String
    let nome: String
    let tipo_selecionado: String
    let data_inicio: String
    let horario_inicio: String
    let dias_duracao: Int
    let frequencia_horas: Int
}

struct VacinaUsuario: Codable, Hashable {
    let vac_id: String
    let nome: String
    let data_aplicacao: String?
    let dose: String
}

struct Familia: Codable, Hashable {
    let parentesco: String
    let nomeU: String
    let sobrenome: String
    let idade: Int
    let sexo: String
    let tipoSanguineo: String
    let alergia: String
    let problemaDeSaude: String
    let telefone: String
    let email: String
}
