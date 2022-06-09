//
//  SwiftUIView.swift
//  
//
//  Created by Matthew Hanlon on 6/9/22.
//

import SwiftUI

@available(iOS 14.0, *)
public struct MyTimerView: View {
    private var timeFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }
    
    @State var isRunning: Bool
    @StateObject var timer = TimerViewModel()
    
    public init(isRunning: Bool = false) {
        self.isRunning = isRunning
    }

    
    public var body: some View {
        VStack {
            Image(systemName: "timer.square")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.system(size: 72))
            Text(self.timeFormatter.string(from: TimeInterval(self.timer.currentValue)) ?? "0")
                .font(.system(size: 48))
            HStack {
                Button(isRunning ? "Stop" : "Start") {
                    // start the timer
                    if isRunning {
                        self.timer.stop()
                    } else {
                        self.timer.start()
                    }
                    isRunning.toggle()
                }
                .padding(10.0)
                .background(Capsule()
                    .foregroundColor(isRunning ? .red : .green))
                Button("Reset") {
                    //time = "00:00"
                    self.timer.reset()
                }
            }
            .padding()
        }
        .padding()
    }
}

@available(iOS 14.0, *)
public struct MyTimerView_Previews: PreviewProvider {
    public static var previews: some View {
        MyTimerView()
    }
}
