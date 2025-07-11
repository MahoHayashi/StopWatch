//
//  ContentView.swift
//  StopWatch
//
//  Created by maho hayashi on 2025/07/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer: Timer!
    @State private var secondsElapsed : Double = 0.0 //経過時間
    @State private var isRunning = false
    
    var body: some View {
        VStack {
            //秒数を表すにはformatが必要になる
            Text(String(format: "%.2f", secondsElapsed))
                .font(.title)
            HStack {
                if isRunning {
                    Button {
                        pause()
                    } label: {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.orange)
                            .clipShape(.circle)
                    }
                }else{
                    Button {
                        start()
                    } label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .clipShape(.circle)
                    }
                }
                if secondsElapsed != 0.0 {
                    Button {
                        stop()
                    } label: {
                        Image(systemName: "stop.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .clipShape(.circle)
                    }
                }
            }
        }
        .padding()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            secondsElapsed += 0.1
        }
        isRunning = true
    }
    
    func pause() {
        timer.invalidate()
        isRunning = false
    }
    
    func stop() {
        timer.invalidate()
        isRunning = false
        secondsElapsed = 0.0
    }
        
}

#Preview {
    ContentView()
}
