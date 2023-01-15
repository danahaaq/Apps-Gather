//
//  File.swift
//  Test
//
//  Created by Aldanah Alqbbani on 20/06/1444 AH.
//
import SwiftUI
import AVFoundation

var utterance1 = AVSpeechSynthesizer()
struct SpeachApp: View {
    var body: some View {
        NavigationView{
            HStack(alignment: .center, spacing: 20){
                Text("Best Sentence you ever listen to")
                Button {
                    let utterance = AVSpeechUtterance(string:"danah ali algabbni is the greatest Girl in the word ")
                    let voices = AVSpeechSynthesisVoice.speechVoices()
                    for voice in voices {
                        print(voice.language)
                    }
                    
                    utterance1.speak(utterance)
                }
            label: {
                Image(systemName: "speaker.wave.2")
                    .foregroundColor(.black)
            }
                Button {
                    utterance1.stopSpeaking(at: .immediate)
                }
            label: {
                Image(systemName: "speaker.slash")
                    .foregroundColor(.black)
            }
            }.navigationTitle("Speach App")
        }
    }
}
struct SpeachApph_Previews: PreviewProvider {
    static var previews: some View {
        SpeachApp()
    }
}
