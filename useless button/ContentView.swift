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
    @State private var resetMoves = [
        move(image: "", xOffset: 0.0, yOffset: 0.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "catpaw", xOffset: -50.0, yOffset: -50.0, width: 50.0, height: 50.0, spin: 0)]
    var body: some View {
        VStack {
            Image(resetMoves[resetMoveNum % resetMoves.count].image)
                .resizable()
                .frame(width: resetMoves[resetMoveNum % resetMoves.count].width, height: resetMoves[resetMoveNum % resetMoves.count].height)
                .offset(x: resetMoves[resetMoveNum % resetMoves.count].xOffset, y: resetMoves[resetMoveNum % resetMoves.count].yOffset)
            Button {
                resetMoveNum += 1
            } label: {
                Text("Click Me!\(resetMoveNum)")
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
