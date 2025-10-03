//
//  FaqView.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 03/10/2025.
//


import SwiftUI

struct FaqView: View {
    @Binding var activeScreen: ActiveScreen
    @State private var showMenu = false
    
    var faqList = [
        FaqItem(emoji: "slippers", question: "Er tøfler nødvendig, eller kan vi gå i sokkene?", answer: "Det er lurt å ta med tøfler – gulvet kan være kaldt, og det blir ekstra koselig å tasse rundt i dem."),
        FaqItem(emoji: "blanket", question: "Må vi ta med sengetøy selv, eller finnes det på hytta?", answer: "Det er puter og dyner på hytta, men du må ta med eget sengetøy (laken, dynetrekk og putevar)."),
               FaqItem(emoji: "baking-bowl", question: "Blir det noe baking eller høstsnacks på hytta?", answer: "Ja! Vi tar med litt snacks, og så ser vi om vi får til noe baking sammen."),
               FaqItem(emoji: "hot-chocolate", question: "Har vi ingredienser til kakao, eller må vi ta med selv?", answer: "Kakao er obligatorisk – vi har basis, men ta gjerne med din favoritt-topping (marsmallows, krem, kanel)."),
               FaqItem(emoji: "scarf", question: "Hva bør vi pakke for uteaktiviteter i kaldt høstvær?", answer: "Ta med skjerf, ullsokker og gjerne en ullgenser. Det blir både peiskos inne og tur ute."),
               FaqItem(emoji: "pyjamas", question: "Er det lov med pysj hele søndagen, eller har vi planer ute?", answer: "Selvfølgelig er det lov med pysjdag! Planene er fleksible – comfort first."),
               FaqItem(emoji: "yoghurt-bowl", question: "Hva blir det til frokost – yoghurt, granola eller bare kaffe?", answer: "Det blir litt av hvert – yoghurtbowls, pannekaker og masse kaffe."),
               FaqItem(emoji: "wool-sweater", question: "Er det best å pakke lette klær, eller er ullgenser et must?", answer: "Ullgenser er alltid et must på hyttetur – høstkulda kan komme fort."),
               FaqItem(emoji: "cinnamon-roll", question: "Har vi planlagt et kanelbolleøyeblikk, eller må noen bake?", answer: "Kanelbollepause er på planen! Om vi baker selv eller tar med ferdig, avgjør vi sammen.")
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
                    Image("faq-left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Text("FAQ")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Image("faq-right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                } // End HStack
                ScrollView{
                    VStack(spacing: 16){
                        ForEach(faqList){ item in
                            VStack(alignment: .leading, spacing: 8){
                                HStack{
                                    Image(item.emoji)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)
                                    Text(item.question)
                                        .font(.system(size: 16, weight: .bold))
                                }// End HStack
                                Text(item.answer)
                                    .font(.system(size: 16))
                            }// End VStack
                            .frame(maxWidth: 364, alignment: .leading)
                            .padding()
                            .background(Color(hex: "FFFDE5"))
                            .cornerRadius(20)
                            
                        } // End ForEach
                        
                    }// End VStack

                }// End ScrollView
                .padding(.horizontal, 30)
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
    FaqView(activeScreen: .constant(.faq))
}
