//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Berkay Sancar on 23.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.system(size: 30).weight(.bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                VStack {
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                    VStack(spacing: 30) {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number: number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule ())
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20 ))
                
                Text("Score: \(score)")
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
        }
    }
    
    private func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
