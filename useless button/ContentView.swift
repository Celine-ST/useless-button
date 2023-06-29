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
        move(image: "catpaw", xOffset: 50, yOffset: 50, spin: 0)]
    var body: some View {
        VStack {
            Button {
                resetMoveNum += 1
            } label: {
                Text("Click Me!\(resetMoveNum)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
