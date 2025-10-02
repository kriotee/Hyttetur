//
//  PrimaryButtonStyle.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 02/10/2025.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var background: Color = Color(hex: "FE9ACF")
    var shadow: Color = Color(hex: "FD68B7")
    var foreground: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 364, height: 62)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(background)
                    .shadow(color: shadow, radius: 0, x: 0, y: 4)
                    
            )
            .foregroundColor(foreground)
            .font(.system(size: 24, weight: .bold))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}
