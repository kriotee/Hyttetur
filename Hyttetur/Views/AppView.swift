//
//  AppView.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 02/10/2025.
//

import SwiftUI

enum ActiveScreen {
    case home, packinglist, program, map, menu, faq
}

struct AppView: View{
    @State private var activeScreen: ActiveScreen = .home
    
    var body: some View {
        switch activeScreen {
            case .home:
                HomeView(activeScreen: $activeScreen)
            case .packinglist:
                Text("Pakkeliste")
            case .program:
                Text("Program")
            case .map:
                Text("Kart")
            case .menu:
                Text("Meny")
            case .faq:
                Text("Faq")
        }
    }
}
