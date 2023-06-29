//
//  ContentView.swift
//  useless button
//
//  Created by Celine Quek on 24/6/23.
//
/* hii so um we can put some ideas for ways to unpress the button here

 - cloud comes and water droplet unpresses button
 
 - yj comes to unpress button
 */

import SwiftUI

struct ContentView: View {
    @State private var resetMoveNum = 0
    @State private var buttonClicked = false
    @State private var resetMoves = [
        move(image: "catpaw", xOffset: 0.0, yOffset: 300.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "catpaw", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "waterdrop", xOffset: 0.0, yOffset: -490.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "waterdrop", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0)]
    var body: some View {
        ZStack {
                Image(resetMoves[resetMoveNum % resetMoves.count].image)
                    .resizable()
                    .frame(width: resetMoves[resetMoveNum % resetMoves.count].width, height: resetMoves[resetMoveNum % resetMoves.count].height)
                    .offset(x: resetMoves[resetMoveNum % resetMoves.count].xOffset, y: resetMoves[resetMoveNum % resetMoves.count].yOffset)
            Button {
                withAnimation {
                    resetMoveNum += 1
                    buttonClicked = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation {
                        resetMoveNum -= 1
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    resetMoveNum += 2
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    withAnimation {
                        buttonClicked = false
                    }
                }
            } label: {
                Text(buttonClicked ? "Button Clicked!" : "Click Me!")
            }
            .padding()
            .background(buttonClicked ? .cyan : .blue)
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
