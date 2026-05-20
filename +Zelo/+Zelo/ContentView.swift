//
//  ContentView.swift
//  +Zelo
//
//  Created by Turma01-7 on 18/05/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            
            TabView {
//                HomeView()
//                    .badge(0)
//                    .tabItem {
//                        Label("Home", systemImage: "paintbrush")
//                        
//                    }
                
                VacinasView()
                    .badge(0)
                    .tabItem {
                        Label("Vacinas", systemImage: "paintbrush.pointed")
                    }
                
                RotinasView()
                    .badge(2)
                    .tabItem {
                        Label("Rotinas", systemImage: "paintpalette")
                    }
                
                PersonView()
                    .badge(0)
                    .tabItem {
                        Label("Perfil", systemImage: "person")
                    }
            }
            .navigationTitle("+Zelo")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: NotificationView()) {
                        Image(systemName: "bell")
                    }
                }
            }
        }
        .accentColor(.corSecundaria)
    }
}

#Preview {
    ContentView()
}

