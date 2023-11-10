//  /*
//
//  Project: TimerandonReceive
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.11.2023
//
//  */

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Current Time
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // Countdown to date

    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.white, Color.gray],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            if count <= 1 {
                finishedText = "Damn!"
            } else {
                count -= 1
            }
        })
    }
}

#Preview {
    ContentView()
}

