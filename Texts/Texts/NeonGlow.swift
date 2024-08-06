//
//  NeonGlow.swift
//  Texts
//
//  Created by Samuel Lee on 6/8/2567 BE.
//

import SwiftUI

struct NeonGlow: View {
    
    @State var Index = 0
    let color: [Color] = [.green, .pink, .blue, .mint, .indigo, .orange, .red, .teal, .green, .pink]
    let title: [String] = ["Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two", "One"]
    var body: some View {
        Text(title[Index])
            .font(.system(size: 70, weight: .thin))
            .contentTransition(.numericText())
            .frame(width: 250)
            .shadow(color: color[Index], radius: 5)
            .shadow(color: color[Index], radius: 5)
            .shadow(color: color[Index], radius: 50)
            .shadow(color: color[Index], radius: 100)
            .shadow(color: color[Index], radius: 200)
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    withAnimation{
                        Index = (Index + 1) % color.count
                    }
                    
                }
            }
    }
}

#Preview {
    NeonGlow()
}
