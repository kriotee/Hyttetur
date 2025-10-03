//
//  ProgramView.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 03/10/2025.
//

import SwiftUI

struct ProgramView: View {
    @Binding var activeScreen: ActiveScreen
    @State private var showMenu = false
    
    var fridayProgramList = [
        ProgramItem(activity: "Avreise hjemme", time: "15:00"),
        ProgramItem(activity: "Filmkveld & Middag", time: "18:00"),
        ProgramItem(activity: "Singstar", time: "19:00")
    ]
    
    var saturdayProgramList = [
        ProgramItem(activity: "Mat pilates", time: "10:00"),
        ProgramItem(activity: "Frokost", time: "11:00"),
        ProgramItem(activity: "Bytur", time: "13:00"),
        ProgramItem(activity: "Middag", time: "18:00"),
        ProgramItem(activity: "Paint on Pots", time: "19:00"),
        ProgramItem(activity: "Musikkbingo", time: "21:00")
    ]
    
    var sundayProgramList = [
        ProgramItem(activity: "Mat pilates", time: "10:00"),
        ProgramItem(activity: "Frokost", time: "11:00"),
        ProgramItem(activity: "Avreise hytta", time: "13:00")
    ]
    
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
                    Image("program-left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Text("Program")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Image("program-right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                } // End HStack
                
                ScrollView{
                    VStack(spacing: 24){
                        // Friday
                        VStack(alignment: .leading, spacing: 16){
                            Text("Fredag")
                                .fontWeight(.bold)
                            ForEach(fridayProgramList) { item in
                                HStack{
                                    Text(item.time)
                                        .fontWeight(.bold)
                                    Text(item.activity)
                                }
                            }
                        }// End VStack
                        .padding()
                        .frame(width: 364, height: 180, alignment: .leading)
                        .background(Color(hex: "#FFFDE5"))
                        .cornerRadius(20)
                        // Saturday
                        VStack(alignment: .leading, spacing: 16){
                            Text("Lørdag")
                                .fontWeight(.bold)
                            ForEach(saturdayProgramList) { item in
                                HStack{
                                    Text(item.time)
                                        .fontWeight(.bold)
                                    Text(item.activity)
                                }
                            }
                        }// End VStack
                        .padding()
                        .frame(width: 364, height: 300, alignment: .leading)
                        .background(Color(hex: "#FFFDE5"))
                        .cornerRadius(20)
                        // Sunday
                        VStack(alignment: .leading, spacing: 16){
                            Text("Søndag")
                                .fontWeight(.bold)
                            ForEach(sundayProgramList) { item in
                                HStack{
                                    Text(item.time)
                                        .fontWeight(.bold)
                                    Text(item.activity)
                                }
                            }
                        }// End VStack
                        .padding()
                        .frame(width: 364, height: 180, alignment: .leading)
                        .background(Color(hex: "#FFFDE5"))
                        .cornerRadius(20)
                        
                    } // End VStack Programs
                    .font(.system(size: 20))
                    
                } // End ScrollView
                
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
    ProgramView(activeScreen: .constant(.program))
}
