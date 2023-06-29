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
    var body: some View {
        VStack {
            Image(systemName: "mail")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
