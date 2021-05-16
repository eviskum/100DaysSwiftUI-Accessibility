//
//  ContentView.swift
//  Accessibility
//
//  Created by Esben Viskum on 16/05/2021.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    @State private var estimate = 25.0
    @State private var rating = 3
    
    var body: some View {
        VStack {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture(perform: {
                    self.selectedPicture = Int.random(in: 0...3)
                })
                .accessibility(label: Text(labels[selectedPicture]))
                .accessibility(addTraits: .isButton)
                .accessibility(removeTraits: .isImage)
                .padding()
            
            VStack {
                Text("Your score is")
                Text("1000")
            }
            .accessibilityElement(children: .ignore)
            .accessibility(label: Text("Your score is 1000"))
            .padding()
            
            Slider(value: $estimate, in: 0...50)
                .accessibility(value: Text("\(Int(estimate))"))
                .padding()
            
            Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
                .accessibility(value: Text("\(rating) out of 5"))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
