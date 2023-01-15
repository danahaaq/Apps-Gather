//
//  Guess_the_Flag.swift
//  Test
//
//  Created by Aldanah Alqbbani on 22/06/1444 AH.
//

import Foundation
import SwiftUI

struct Guess_the_Flag: View {
    // .Shuffled means mix the array again
    @State private var Flags = ["Germany","Estonia","Nigeria","Poland","Russia","Spain","France","UK", "US" ].shuffled()
    // for the alert
    @State private var showingScore = false
    @State private var showingScore2 = false
    @State private var scoreTitle = ""
    @State private var scoreTitle2 = ""
    // so we can randomly shaow the flags
    @State var RandomFlags = Int.random(in: 0...3)
    // to counter the success
    @State private var Score = 0
    @State private var Repeat = 0
    var body: some View{
        NavigationView{
            ZStack(alignment: .center){
                
                Color.blue.opacity(0.6).ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 15){
                    Text("Tap the Flag Of")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text(Flags[RandomFlags])
                        .font(.largeTitle)
                        .foregroundColor(.indigo)
                        .fontWeight(.black)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(Flags[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Score: \(Score)")
                            .foregroundColor(.white)
                            .font(.title.bold())
                        Text("Repeat: \(Repeat)")
                            .foregroundColor(.white)
                            .font(.title.bold())
                    }
                }
            }.alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(Score)")
            }
            .alert(scoreTitle2, isPresented: $showingScore2) {
                Button("Repeat", action: askQuestion)
                Button("Cancel", role: .cancel, action: executeDelete )
            } message: {
                Text("Your score is \(Score)")
            }
            .navigationTitle("Guess the Flag App")
        }
        
    }
    func flagTapped(_ number: Int) {
        if number == RandomFlags {
            scoreTitle = "Correct"
            Score += 1
            showingScore = true
        } else {
            scoreTitle2 = "Wrong, You Lose Your Score:("
            Score = 0
            Repeat += 1
            showingScore2 = true
        }
    }
    func askQuestion() {
        Flags.shuffle()
        RandomFlags = Int.random(in: 0...2)
    }
    func executeDelete() {
            print("deleting…")
        }
}
struct Guess_the_Flag_Previews:PreviewProvider{
    static var previews: some View {
        Guess_the_Flag()
    }
}
    
    
