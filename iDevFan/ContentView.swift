//
//  ContentView.swift
//  iDevFan
//
//  Created by Abdusamad Mamasoliyev on 22/01/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var rotation: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color("bg1")
            RoundedRectangle(cornerRadius: 130, style: .continuous)
                .frame(width: 260, height: 260)
                .foregroundColor (Color ("bg"))
            RoundedRectangle(cornerRadius: 135, style: .continuous)
                .frame(width: 300 , height: 270)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(colors:[Color("bg2"),Color("bg4"),Color("bg3"),]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 135, style: .continuous)
                        .stroke(lineWidth: 7)
                        .frame(width: 256, height: 256)
                }
            Text("iDevFan").bold()
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .onAppear {
            withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
