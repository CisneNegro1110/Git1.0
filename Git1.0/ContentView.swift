//
//  ContentView.swift
//  Git1.0
//
//  Created by Jesús Francisco Leyva Juárez on 06/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSide: SideOfTheImage = .alien
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose a Side", selection: $selectedSide){
                    ForEach(SideOfTheImage.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                ChooseItem(selectedSide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a Side")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum SideOfTheImage: String, CaseIterable {
    case alien = "Alien"
    case astronauta = "Astronauta"
    case weed = "Weed"
}

struct ChooseItem: View {
    var selectedSide: SideOfTheImage
    
    var body: some View {
        switch selectedSide {
        case .alien:
            ImageView(imageNameItem: "alien")
        case .astronauta:
            ImageView(imageNameItem: "astronauta")
        case .weed:
            ImageView(imageNameItem: "weed")
        }
    }
}

struct ImageView: View {
    var imageNameItem: String
    var body: some View {
        Image(imageNameItem)
            .resizable()
            .frame(width: 250, height: 400)
            .shadow(color: .white, radius: 100)
    }
}

