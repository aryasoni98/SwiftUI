//
//  ContentView.swift
//  Creating and Combining Views
//
//  Created by Arya Soni on 18/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Arya Soni")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                HStack {
                    Text("Welcome To SwiftUi World!")
                    Spacer()
                    Text("Gurugram")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Me")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Contributing to open source can be a rewarding way to learn, teach, and build experience in just about any skill you can imagine.")
            }
            .padding()

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
