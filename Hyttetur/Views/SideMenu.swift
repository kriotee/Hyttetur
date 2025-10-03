//
//  SideMenu.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 02/10/2025.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @Binding var activeScreen: ActiveScreen
    
    var body: some View {
        ZStack(alignment: .trailing){
            Color.black.opacity(showMenu ? 0.0 : 0)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showMenu = false
                    }
                }
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation{
                            showMenu.toggle()
                        }
                    }){
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 32)
                            .foregroundColor(Color(hex: "FD68B7"))
                    }
                }
                Button("Hjem"){
                    activeScreen = .home
                    showMenu = false
                }
                Button("Pakkeliste"){
                    activeScreen = .packinglist
                    showMenu = false
                }
                Button("Program"){
                    activeScreen = .program
                    showMenu = false
                }
                Button("Kart"){
                    activeScreen = .map
                    showMenu = false
                }
                Button("Meny"){
                    activeScreen = .menu
                    showMenu = false
                }
                Button("FAQ"){
                    activeScreen = .faq
                    showMenu = false
                }
                Spacer()
            }
            .padding()
            .frame(width: 340, alignment: .leading)
            .background(Color(hex: "#FE9ACF"))
            .offset(x: showMenu ? 0 : -240)
            .animation(.easeInOut, value: showMenu)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
        }
    }
}

#Preview {
    SideMenu(showMenu: .constant(true), activeScreen: .constant(.home))
}
