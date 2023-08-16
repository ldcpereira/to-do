//
//  ContentView.swift
//  ToDo
//
//  Created by Lucas Pereira on 13/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ViewController().makeUIViewController()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
