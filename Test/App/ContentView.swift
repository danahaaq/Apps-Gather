//
//  ContentView.swift
//  Test
//
//  Created by Aldanah Alqbbani on 14/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var parentRect: CGRect = .zero
    @State private var childRect: CGRect = .zero

    func correctPostion() {
        print(self.currentPosition)
        if self.currentPosition.width > 100 {
            self.currentPosition.width = 100
        }
        if self.currentPosition.height > 200 {
            self.currentPosition.height = 200
        }
        if self.currentPosition.width < -100 {
            self.currentPosition.width = -100
        }
        if self.currentPosition.height < -200 {
            self.currentPosition.height = -200
        }
    }
    var body: some View {
        NavigationView{
            VStack {
                Rectangle()
                    .frame(width: 300, height: 30, alignment: .top)
                    .foregroundColor(.blue)
                    .offset(x: 0, y: self.currentPosition.height)
                    .background(GeometryGetter(rect: $childRect))
                
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .global)
                            .onChanged { value in
                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                
                                self.correctPostion()
                            }
                            .onEnded { value in
                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                
                                self.correctPostion()
                                
                                self.newPosition = self.currentPosition
                            }
                    )
            }
            .frame(width: 300, height: 500, alignment: .center)
            .border(Color.black, width: 1)
            .background(GeometryGetter(rect: $parentRect))
            .navigationTitle("Change Position App")
        }
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }
                return AnyView(Color.clear)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
