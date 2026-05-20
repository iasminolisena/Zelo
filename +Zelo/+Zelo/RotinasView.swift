//
//  RotinasView.swift
//  ProjetoFinal
//
//  Created by Turma01-5 on 18/05/26.
//

import SwiftUI

struct RotinasView: View {
    let CorPrimaria     = Color("CorPrimaria")
    let CorSecundaria   = Color("CorSecundaria")
    let CorTerciaria    = Color("CorTerciaria")
    let CorAlerta       = Color("CorAlerta")
    let CorNotificacao  = Color("CorNotificacao")
    
    @StateObject private var viewModel = ViewModel()
    @State private var mostrarPopup = false
    @State private var nomeRemedio: String = ""
    @State private var dosagemRemedio: String = ""
    @State private var formularioAtivo: TipoFormulario? = nil
    @State private var consultaSelecionada: ConsultaMedica? = nil
    
    enum TipoFormulario: Identifiable{
        case medicamento, rotina, consulta
            
        var id: Self { self } // Isso resolve a exigência do SwiftUI
    }

    
    
    
    
    let consultas = ["Cardiologista", "Endocrino"]
    struct ConsultaMedica: Identifiable {
        let id = UUID()
        let especialidade: String
        let descricaoC: String
    }
        
    let listaConsultas = [
            ConsultaMedica(especialidade: "Cardiologista", descricaoC: "10/05/26 as 18:00 horas"),
            ConsultaMedica(especialidade: "Endocrino", descricaoC: "20/05/26 as 18:00 horas")
    ]
    
    
    
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25) {
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Olá, Giovanna!")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Medicamentos")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        
                        Button(action: { formularioAtivo = .medicamento }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.gray.opacity(0.4))
                                .font(.title3)
                        }
                    }
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 16) {
//                            // Agora o ForEach roda a nossa lista real de remédios
//                            ForEach(listaMedicamentos) { remedio in
//                                
//                                // Transforma o card em um botão clicável
//                                Button(action: {
//                                    medicamentoSelecionado = remedio // Salva o remédio clicado aqui!
//                                }) {
//                                    VStack(alignment: .leading, spacing: 8) {
//                                        HStack {
//                                            Text(remedio.nome)
//                                                .font(.system(size: 18, weight: .bold))
//                                            Spacer()
//                                            Image(systemName: "pill")
//                                        }
//                                        
//                                        Text(remedio.dosagem)
//                                            .font(.system(size: 12))
//                                            .opacity(0.9)
//                                        
//                                        Spacer(minLength: 12)
//                                        
//                                        VStack(alignment: .leading, spacing: 2) {
//                                            Text("Próxima dose:")
//                                                .font(.system(size: 11, weight: .semibold))
//                                            Text(remedio.próximaDose)
//                                                .font(.system(size: 13, weight: .bold))
//                                        }
//                                    }
//                                    .foregroundColor(.white)
//                                    .padding(14)
//                                    .frame(width: 170, height: 130, alignment: .topLeading)
//                                    .background(CorPrimaria)
//                                    .cornerRadius(12)
//                                }
//                            }
//                        }
//                    }
//                }
//                
                // 3. Seção de Rotinas (Em grade horizontal conforme o print)
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Alimentação")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        
                        Button(action: { formularioAtivo = .rotina }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.gray.opacity(0.4))
                                .font(.title3)
                        }
                    }
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 16) {
//                            // O ForEach agora roda a lista real de rotinas alimentares
//                            ForEach(listaRotinas) { rotina in
//                                
//                                // Transforma o card de alimentação em um botão clicável
//                                Button(action: {
//                                    rotinaSelecionada = rotina
//                                }) {
//                                    VStack(alignment: .leading, spacing: 6) {
//                                        HStack {
//                                            Text(rotina.titulo)
//                                                .font(.system(size: 16, weight: .bold))
//                                                .lineLimit(nil)
//                                                .fixedSize(horizontal: false, vertical: true)
//                                            
//                                            Spacer()
//                                        }
//                                        
//                                        Text(rotina.descricao)
//                                            .font(.system(size: 12))
//                                            .opacity(0.9)
//                                            .lineLimit(2) // Mantém a descrição organizada em até 2 linhas
//                                    }
//                                    .foregroundColor(.white)
//                                    .padding(14)
//                                    // Mantém o tamanho padrão que você definiu para os cards de rotina
//                                    .frame(width: 140, height: 95, alignment: .topLeading)
//                                    .background(CorSecundaria) // Usa a cor verde-água da sua identidade
//                                    .cornerRadius(12)
//                                }
//                            }
//                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Consultas")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        
                        Button(action: { formularioAtivo = .consulta }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.gray.opacity(0.4))
                                .font(.title3)
                        }
                    }
                    
                    // Lista vertical simples para empilhar as consultas como no Figma
                    VStack(spacing: 12) {
                        // O ForEach agora roda a lista real de consultas médicas
                        ForEach(listaConsultas) { consulta in
                            
                            // Transforma o card de consulta em um botão clicável
                            Button(action: {
                                 consultaSelecionada = consulta
                            }) {
                                HStack {
                                    Text(consulta.especialidade)
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.leading, 16) // Recuo para o texto não colar na borda esquerda
                                    
                                    Spacer() // Empurra o espaço restante para fixar o texto na esquerda
                                    
                                    Image(systemName: "chevron.right") // Uma setinha sutil indica que o card é clicável
                                        .foregroundColor(.white.opacity(0.7))
                                        .padding(.trailing, 16)
                                }
                                .frame(maxWidth: .infinity) // Faz o botão ocupar toda a largura da tela
                                .frame(height: 55)          // Altura padrão do seu design do Figma
                                .background(CorSecundaria)   // Cor verde-água da seção
                                .cornerRadius(12)
                            }
                        }
                    }                }
            }
            .padding(.horizontal, 20)
        }
        //.background(Color.white.ignoresSafeArea())
        
        // MARK: - POPUP (Sheet com ScrollView)
        // A sheet abre automaticamente quando 'formularioAtivo' ganha um valor
        .sheet(item: $formularioAtivo) { tipo in
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 24) {
                    
                    // Barra de arrastar do iOS
                    Capsule()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 5)
                        .padding(.top, 10)
                    
                    // O SWITCH decora a tela com as perguntas certas!
                    switch tipo {
                    case .medicamento:
                        Text("Digite o nome do remédio:")
                        TextField("Digite o nome do remédio", text: $nomeRemedio)
                            .padding(20)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(width:300,height:80)
                        
                        Text("Digite a dosagem do remédio:")
                        TextField("Digite a dosagem do remédio", text: $nomeRemedio)
                            .padding(20)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(width:300,height:80)
                        
                        Text("Digite a quantidade a consumir:")
                        TextField("Digite a quantidade a consumir", text: $nomeRemedio)
                            .padding(20)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(width:300,height:80)
                        
                        Text("Digite o tipo (ex: comprimido, xarope...):")
                        TextField("Digite o tipo (ex: comprimido, xarope...)", text: $nomeRemedio)
                            .padding(20)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(width:300,height:80)
                        
                        Text("Digite o primeiro horário:")
                        TextField("Digite o primeiro horário", text: $nomeRemedio)
                            .padding(20)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(width:300,height:80)
                        
                    case .rotina:
                        Text("Nova Alimentação")
                            .font(.title2).fontWeight(.bold)
                        
                        Text("Nome da Refeição (Ex: Almoço)")
                        TextField("Nome da Refeição (Ex: Almoço)", text: $nomeRemedio) // Pode reusar as variáveis para testar
                            .padding().background(Color(.systemGray6)).cornerRadius(10)
                        
                        Text("Alimentos")
                        TextField("Alimentos", text: $dosagemRemedio)
                            .padding().background(Color(.systemGray6)).cornerRadius(10)
                        
                        Text("Horário")
                        TextField("Horário", text: $dosagemRemedio)
                            .padding().background(Color(.systemGray6)).cornerRadius(10)
                        
                    case .consulta:
                        Text("Agendar Consulta")
                            .font(.title2).fontWeight(.bold)
                        
                        Text("Especialidade Médica")
                        TextField("Especialidade Médica", text: $nomeRemedio)
                            .padding().background(Color(.systemGray6)).cornerRadius(10)
                        
                        Text("Horário da consulta")
                        TextField("Horário da consulta", text: $dosagemRemedio)
                            .padding().background(Color(.systemGray6)).cornerRadius(10)
                        
                        Text("Descrição")
                        TextField("Descrição", text: $dosagemRemedio)
                            .padding().background(Color(.systemGray6)).cornerRadius(10)
                    }
                    
                    // Botão único de salvar para todos
                    Button(action: {
                        // Para fechar a sheet, basta esvaziar a variável voltando para 'nil'
                        formularioAtivo = nil
                    }) {
                        Text("Salvar")
                            .font(.headline).foregroundColor(.white)
                            .padding().frame(maxWidth: .infinity)
                            .background(CorPrimaria)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
            }
            .presentationDetents([.medium, .large])
        }
        
//        // Esse popup abre sozinho assim que 'medicamentoSelecionado' recebe o remédio que você clicou
//        .sheet(item: $medicamentoSelecionado) { remedio in
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack(spacing: 24) {
//                    
//                    Capsule()
//                        .fill(Color.gray.opacity(0.3))
//                        .frame(width: 40, height: 5)
//                        .padding(.top, 10)
//                    
//                    // Ícone grande decorativo
//                    Image(systemName: "pill.circle.fill")
//                        .resizable()
//                        .frame(width: 60, height: 60)
//                        .foregroundColor(CorPrimaria)
//                    
//                    Text("Detalhes do Medicamento")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                    
//                    // Informações do Remédio Clicado
//                    VStack(alignment: .leading, spacing: 16) {
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Nome")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(remedio.nome)
//                                .font(.body).fontWeight(.medium).foregroundColor(.black)
//                        }
//                        
//                        Divider()
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Dosagem cadastrada")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(remedio.dosagem)
//                                .font(.body).foregroundColor(.black)
//                        }
//                        
//                        Divider()
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Horário da Próxima Dose")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(remedio.próximaDose)
//                                .font(.body).fontWeight(.bold).foregroundColor(CorAlerta)
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(12)
//                    
//                    // Botão para fechar
//                    Button(action: {
//                        medicamentoSelecionado = nil // Fecha o popup
//                    }) {
//                        Text("Fechar")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(CorPrimaria)
//                            .cornerRadius(12)
//                    }
//                    .padding(.top, 10)
//                }
//                .padding(.horizontal, 24)
//                .padding(.bottom, 30)
//            }
//            .presentationDetents([.medium]) // Abre apenas até a metade da tela
//        }
//        
//        .sheet(item: $rotinaSelecionada) { rotina in
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack(spacing: 24) {
//                    
//                    Capsule()
//                        .fill(Color.gray.opacity(0.3))
//                        .frame(width: 40, height: 5)
//                        .padding(.top, 10)
//                    
//                    // Ícone grande decorativo
//                    Image(systemName: "fork.knife")
//                        .resizable()
//                        .frame(width: 60, height: 60)
//                        .foregroundColor(CorPrimaria)
//                    
//                    Text("Detalhes da Alimentação")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                    
//                    // Informações do Remédio Clicado
//                    VStack(alignment: .leading, spacing: 16) {
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Refeição")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(rotina.titulo)
//                                .font(.body).fontWeight(.medium).foregroundColor(.black)
//                        }
//                        
//                        Divider()
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Descrição")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(rotina.descricao)
//                                .font(.body).foregroundColor(.black)
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(12)
//                    
//                    // Botão para fechar
//                    Button(action: {
//                        rotinaSelecionada = nil // Fecha o popup
//                    }) {
//                        Text("Fechar")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(CorPrimaria)
//                            .cornerRadius(12)
//                    }
//                    .padding(.top, 10)
//                }
//                .padding(.horizontal, 24)
//                .padding(.bottom, 30)
//            }
//            .presentationDetents([.medium]) // Abre apenas até a metade da tela
//        }
//        
//        .sheet(item: $consultaSelecionada) { consulta in
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack(spacing: 24) {
//                    
//                    Capsule()
//                        .fill(Color.gray.opacity(0.3))
//                        .frame(width: 40, height: 5)
//                        .padding(.top, 10)
//                    
//                    // Ícone grande decorativo
//                    Image(systemName: "heart.text.clipboard")
//                        .resizable()
//                        .frame(width: 60, height: 60)
//                        .foregroundColor(CorPrimaria)
//                    
//                    Text("Detalhes da Alimentação")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                    
//                    // Informações do Remédio Clicado
//                    VStack(alignment: .leading, spacing: 16) {
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Especialidade")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(consulta.especialidade)
//                                .font(.body).fontWeight(.medium).foregroundColor(.black)
//                        }
//                        
//                        Divider()
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("Descrição")
//                                .font(.caption).foregroundColor(.gray).fontWeight(.semibold)
//                            Text(consulta.descricaoC)
//                                .font(.body).foregroundColor(.black)
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(12)
//                    
//                    // Botão para fechar
//                    Button(action: {
//                        consultaSelecionada = nil // Fecha o popup
//                    }) {
//                        Text("Fechar")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(CorPrimaria)
//                            .cornerRadius(12)
//                    }
//                    .padding(.top, 10)
//                }
//                .padding(.horizontal, 24)
//                .padding(.bottom, 30)
//            }
//            .presentationDetents([.medium]) // Abre apenas até a metade da tela
//        }
        
    }
}

#Preview {
    RotinasView()
}
