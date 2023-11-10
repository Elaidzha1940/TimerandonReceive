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
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour): \(minute) : \(second)"
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.black, Color.gray],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            Text(timeRemaining)
                .font(.system(size: 50, weight: .bold, design: .monospaced))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            updateTimeRemaining()
        })
    }
}

#Preview {
    ContentView()
}

