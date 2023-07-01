//
//  ContentView.swift
//  useless button
//
//  Created by Celine Quek on 24/6/23.
//


import SwiftUI

struct ContentView: View {
    @State private var resetMoveNum = 0
    @State private var numResetsx2 = 0
    @State private var buttonClicked = false
    @State private var resetMoves = [
        move(image: "catpaw", xOffset: 0.0, yOffset: 500.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "catpaw", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw2", xOffset: 0.0, yOffset: -500.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw2", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw", xOffset: 0.0, yOffset: 1000.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "catpaw", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw2", xOffset: 0.0, yOffset: -1000.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw2", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw", xOffset: 0.0, yOffset: 1500.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "catpaw", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw2", xOffset: 0.0, yOffset: -1500.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "catpaw2", xOffset: 0.0, yOffset: 0.0, width: 100.0, height: 100.0, spin: 0),
        move(image: "yj", xOffset: 0.0, yOffset: 0.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "yj", xOffset: 0.0, yOffset: 0.0, width: 300.0, height: 300.0, spin: 720),
        move(image: "yj2", xOffset: 0.0, yOffset: 0.0, width: 0.0, height: 0.0, spin: 0),
        move(image: "yj2", xOffset: 0.0, yOffset: 0.0, width: 638.0, height: 391.0, spin: 720)
    ]
    
    private var colors = [Color.red, Color.green, Color.blue, Color.orange, Color.purple]
    
    private var randomBackgroundColor: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
    
    private var randomTextColors: [Color] {
        var colors = [Color]()
        for _ in 0..<20 {
            colors.append(Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
        }
        return colors
    }
    
    var body: some View {
        ZStack {
            randomBackgroundColor
                .ignoresSafeArea()
            
            Image(resetMoves[resetMoveNum % resetMoves.count].image)
                .resizable()
                .frame(width: resetMoves[resetMoveNum % resetMoves.count].width, height: resetMoves[resetMoveNum % resetMoves.count].height)
                .offset(x: resetMoves[resetMoveNum % resetMoves.count].xOffset, y: resetMoves[resetMoveNum % resetMoves.count].yOffset)
                .rotationEffect(.degrees(resetMoves[resetMoveNum % resetMoves.count].spin))
            
            if resetMoveNum == 13 || resetMoveNum == 15 {
                Button {
                    withAnimation {
                        resetMoveNum = 0
                        numResetsx2 += 2
                        if numResetsx2 == 4 {
                            numResetsx2 = 0
                        }
                    }
                } label: {
                    Text("Click to Reset")
                }
                .padding()
                .background(.white)
                .foregroundColor(.black)
                .cornerRadius(45)
                .offset(y: 200)
            } else {
                Button {
                    withAnimation {
                        resetMoveNum += 1
                        buttonClicked = true
                    }
                    if resetMoveNum < 13 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                withAnimation {
                                    resetMoveNum -= 1
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                                resetMoveNum += 2
                                withAnimation {
                                    buttonClicked = false
                                    if resetMoveNum == 12 {
                                        resetMoveNum += numResetsx2
                                    }
                            }
                        }
                    }
                } label: {
                    Text(buttonClicked ? "MEOW!" : "Click to Meow")
                        .padding()
                        .background(buttonClicked ? colors[resetMoveNum / 2 % colors.count] : randomBackgroundColor)
                        .foregroundColor(buttonClicked ? randomTextColors[resetMoveNum / 2 % randomTextColors.count] : Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
