//
//  AstronautView.swift
//  Moonshot
//
//  Created by Jay Bhensdadia on 12/04/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .clipShape(Rectangle())
                    .scaledToFill()
                    .overlay(
                        Rectangle()
                            .strokeBorder(.white,lineWidth: 2)
                            .cornerRadius(10)
                    )
                    .padding()
                
                Text(astronaut.description)
                    .font(.custom("SpaceMono-Regular", size: 16))
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}
