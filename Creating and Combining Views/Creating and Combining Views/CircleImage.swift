//
//  CircleImage.swift
//  Creating and Combining Views
//
//  Created by Arya Soni on 18/05/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("aryasoni")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
