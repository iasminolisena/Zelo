//
//  PersonView.swift
//  +Zelo
//
//  Created by Turma01-7 on 18/05/26.
//

import SwiftUI

struct PersonView: View {
    @State private var abaSelecionada: Int = 0
    let abas = [ "Dados","Família", "Histórico", "Exames"]
    
    var body: some View {
        VStack{
            
            Image(systemName: "person")
                .font(.system(size: 100))
            
                .padding()
            
            Text("Giovanna Sales")
                .font(.title)
            
                
            HStack(spacing: 0) {
                ForEach(0..<abas.count, id: \.self) { index in
                    Button(action: { abaSelecionada = index }) {
                        VStack(spacing: 8) {
                            Text(abas[index])
                                .font(.headline)
                                .foregroundColor(abaSelecionada == index ? .corSecundaria : .gray)
                            
                            Rectangle()
                                .fill(abaSelecionada == index ? Color.corSecundaria: Color.clear)
                                .frame(height: 3)
                        }
                        .padding(.top, 50)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            TabView(selection: $abaSelecionada) {
                DadosView()
                    .tag(0)
                FamiliaView()
                    .tag(1)
                HistoricoView()
                    .tag(2)
                ExamesView()
                    .tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .padding(.top, 50)
    }
}

#Preview {
    PersonView()
}
