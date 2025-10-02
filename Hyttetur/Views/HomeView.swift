//
//  HomeView.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 02/10/2025.
//

import SwiftUI

struct HomeView: View {
    @Binding var activeScreen: ActiveScreen
    @State private var showMenu = false
    
    var body: some View {
        ZStack{
            // Background
            LinearGradient(
                colors: [Color(hex: "FFF7B1"), Color(hex: "FECDE7")],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack(spacing: 44){
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation{
                            showMenu.toggle()
                        }
                    }){
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, 32)
                            .foregroundColor(Color(hex: "FFCF52"))
                            .fontWeight(.bold)
                    }
                }
                HStack{
                    Image("heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Text("Jentetur!!")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Image("heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                } // End HStack
                VStack(spacing: 24){
                    Button("Pakkeliste"){ activeScreen = .packinglist}
                    Button("Program"){ activeScreen = .program }
                    Button("Kart"){ activeScreen = .map }
                    Button("Meny"){ activeScreen = .menu }
                    Button("FAQ"){ activeScreen = .faq }
                }// End VStack
                .buttonStyle(PrimaryButtonStyle())
                Spacer()
            }// End VStack
      
            
            // SideMenu overlay
            if showMenu {
                SideMenu(showMenu: $showMenu, activeScreen: $activeScreen)
                    .transition(.move(edge: .trailing))
                    .zIndex(1)
            }
        } // End ZStack
        

    }
}

#Preview {
    HomeView(activeScreen: .constant(.home))
}
