////
////  HomeView.swift
////  +Zelo
////
////  Created by Turma01-7 on 18/05/26.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    let CorPrimaria     = Color("CorPrimaria")
//    let CorSecundaria   = Color("CorSecundaria")
//    let CorTerciaria    = Color("CorTerciaria")
//    let CorAlerta       = Color("CorAlerta")
//    let CorNotificacao  = Color("CorNotificacao")
//    
//    @StateObject private var viewModel = ViewModel()
//    
//    @State private var nomeRemedio: String = ""
//    @State private var dataSelecionada = Date()
//    
//    var proximosDias: [Date] {
//        let calendar = Calendar.current
//        return (0..<31).map { offset in
//            calendar.date(byAdding: .day, value: offset, to: Date())!
//        }
//    }
//    
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack(alignment: .leading, spacing: 25) {
//                
//                HStack {
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text("Olá, Giovanna!")
//                            .font(.system(size: 28, weight: .bold))
//                            .foregroundColor(.black)
//                        
//                        Text("Como você está se sentindo hoje?")
//                            .font(.system(size: 16))
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//                }
//                .padding(.top, 20)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 12) {
//                        ForEach(proximosDias, id: \.self) { data in
//                            VStack(spacing: 8) {
//                                Text(formatarDia(data))
//                                    .font(.system(size: 20, weight: .bold))
//                                Text(formatarDiaSemana(data))
//                                    .font(.system(size: 14, weight: .medium))
//                            }
//                            .frame(width: 70)
//                            .padding(.vertical, 16)
//                            .background(Calendar.current.isDate(dataSelecionada, inSameDayAs: data) ? Color("CorTerciaria") : Color(.systemGray6))
//                            .foregroundColor(Calendar.current.isDate(dataSelecionada, inSameDayAs: data) ? .white : .black)
//                            .cornerRadius(16)
//                            .onTapGesture {
//                                dataSelecionada = data
//                            }
//                        }
//                    }
//                }
//                VStack(alignment: .leading, spacing: 12) {
//                    HStack {
//                        Text("Medicamentos")
//                            .font(.system(size: 20, weight: .bold))
//                            .foregroundColor(.black)
//                    }
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        
//                        HStack(spacing: 8) {
//                            ForEach(viewModel.usuarios.first?.medicament ?? [], id: \.self) { medicamento in
//                                VStack(alignment: .leading, spacing: 8) {
//                                    HStack {
//                                        Text(medicamento.nome)
//                                            .font(.system(size: 18, weight: .bold))
//                                            .lineLimit(1)
//                                        Spacer()
//                                        Image(systemName: "pill")
//                                    }
//                                    Text(medicamento.tipo_selecionado)
//                                        .font(.system(size: 12))
//                                        .opacity(0.9)
//                                    VStack(alignment: .leading, spacing: 2) {
//                                        Text("Próxima dose:")
//                                            .font(.system(size: 11, weight: .semibold))
//                                        //Text(calcularProximaDose(medicamento: medicamento))
//                                            .font(.system(size: 13, weight: .bold))
//                                    }
//                                    .padding(.top, 4)
//                                }
//                                .foregroundColor(.white)
//                                .padding(14)
//                                .frame(width: 190, height: 110, alignment: .topLeading)
//                                .background(CorPrimaria)
//                                .cornerRadius(12)
//                            }
//                        }
//                    }
//                }
//                
//                VStack(alignment: .leading, spacing: 12) {
//                    HStack {
//                        Text("Alimentação")
//                            .font(.system(size: 20, weight: .bold))
//                            .foregroundColor(.black)
//                    }
//                    
//                    //                    ScrollView(.horizontal) {
//                    //                        HStack(spacing: 8) {
//                    //                            ForEach(viewModel.usuarios.first?.routine, id: \.self) { refeicao in
//                    //                                VStack() {
//                    //                                    Text(refeicao.nome)
//                    //                                        .font(.system(size: 16, weight: .bold))
//                    //                                        .padding(.top, 15)
//                    //                                    Spacer()
//                    //                                    HStack(alignment: .top) {
//                    //                                        Text(refeicao.horario)
//                    //                                            .font(.system(size: 12, weight: .medium))
//                    //                                            .multilineTextAlignment(.center)
//                    //                                            .frame(width: 140, height: 50)
//                    //                                    }
//                    //                                    .padding(.horizontal)
//                    //                                    .padding(.bottom)
//                    //                                }
//                    //                                .foregroundColor(.white)
//                    //                                .frame(width: 150, height: 100)
//                    //                                .background(Color(CorSecundaria))
//                    //                                .cornerRadius(12)
//                    //                            }
//                    //                        }
//                    //                        .scrollIndicators(.hidden)
//                    //                    }
//                    //                }
//                }
//                .padding(.horizontal, 15)
//                .onAppear(){
//                    viewModel.fetch()
//                }
//            }
//            //.background(Color.white.ignoresSafeArea())
//        }
//        
//        func formatarDia(_ data: Date) -> String {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd"
//            return formatter.string(from: data)
//        }
//        
//        func formatarDiaSemana(_ data: Date) -> String {
//            let formatter = DateFormatter()
//            formatter.locale = Locale(identifier: "pt_BR")
//            formatter.dateFormat = "EEE"
//            return formatter.string(from: data).capitalized
//        }
//        
//        //    func calcularProximaDose(medicamento: MedicamentoUsuario) -> String {
//        //        let dateFormatter = DateFormatter()
//        //        dateFormatter.locale = Locale(identifier: "pt_BR")
//        //        dateFormatter.dateFormat = "dd/MM/yyyy" // Ajustado para o formato brasileiro comum
//        //
//        //        let timeFormatter = DateFormatter()
//        //        timeFormatter.dateFormat = "HH:mm"
//        //        timeFormatter.locale = Locale(identifier: "pt_BR")
//        //
//        //        // Usando os nomes corretos das propriedades de MedicamentoUsuario
//        //        guard let dataInicio = dateFormatter.date(from: medicamento.data_inicio),
//        //              let horaInicio = timeFormatter.date(from: medicamento.horario_inicio) else {
//        //            return "Não definido"
//        //        }
//        //
//        //        let calendar = Calendar.current
//        //
//        //        // Extrair componentes de hora
//        //        let horaComponentes = calendar.dateComponents([.hour, .minute], from: horaInicio)
//        //
//        //        // Combinar data de início com hora de início
//        //        guard var proximaDose = calendar.date(bySettingHour: horaComponentes.hour ?? 0,
//        //                                              minute: horaComponentes.minute ?? 0,
//        //                                              second: 0,
//        //                                              of: dataInicio) else {
//        //            return "Não definido"
//        //        }
//        //
//        //        let agora = Date()
//        //
//        //        // Calcular data fim do tratamento
//        //        guard let dataFim = calendar.date(byAdding: .day, value: medicamento.dias_duracao, to: dataInicio) else {
//        //            return "Não definido"
//        //        }
//        //
//        //        // Verificar se o tratamento já terminou
//        //        if agora > dataFim {
//        //            return "Tratamento finalizado"
//        //        }
//        //
//        //        // Encontrar a próxima dose após o momento atual
//        //        while proximaDose <= agora {
//        //            guard let novaDose = calendar.date(byAdding: .hour,
//        //                                               value: medicamento.frequencia_horas,
//        //                                               to: proximaDose) else {
//        //                return "Erro no cálculo"
//        //            }
//        //            proximaDose = novaDose
//        //        }
//        //
//        //        // Verificar se a próxima dose excede o fim do tratamento
//        //        if proximaDose > dataFim {
//        //            return "Tratamento finalizado"
//        //        }
//        //
//        //        // Formatar a saída
//        //        let horario = timeFormatter.string(from: proximaDose)
//        //
//        //        if calendar.isDateInToday(proximaDose) {
//        //            return "Hoje, \(horario)"
//        //        } else if calendar.isDateInTomorrow(proximaDose) {
//        //            return "Amanhã, \(horario)"
//        //        } else {
//        //            dateFormatter.dateFormat = "dd/MM"
//        //            let data = dateFormatter.string(from: proximaDose)
//        //            return "\(data), \(horario)"
//        //        }
//        //    }
//    }
//}
//#Preview {
//    HomeView()
//}
