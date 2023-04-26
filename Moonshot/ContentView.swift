//
//  ContentView.swift
//  Moonshot
//
//  Created by Jay Bhensdadia on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "SpaceMono-Bold", size: 40)!]

            //Use this if NavigationBarTitle is with displayMode = .inline
            //UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "SpaceMono-Bold", size: 20)!]
        }
    
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let columns1 = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let columns2 = [ GridItem(.fixed(400))]
    
    var columns : [GridItem] {
        if viewAsList {
            return columns2
        }else{
            return columns1
        }
    }
    
    @State private var viewAsList = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }label: {
                            
                            if viewAsList{
                                HStack{
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100,height: 100)
                                        .padding()
                                    
                                    VStack{
                                        Text(mission.displayName)
                                            .font(.custom("SpaceMono-Bold", size: 16))
                                            .foregroundColor(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.custom("SpaceMono-Bold", size: 11))
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                            }else{
                                VStack{
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100,height: 100)
                                        .padding()
                                    
                                    VStack{
                                        Text(mission.displayName)
                                            .font(.custom("SpaceMono-Bold", size: 16))
                                            .foregroundColor(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.custom("SpaceMono-Bold", size: 11))
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                            }
                           
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle(Text("Moonshot"))
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button{
                    viewAsList.toggle()
                }label: {
                    Image(systemName: viewAsList ? "square.grid.2x2" : "list.bullet")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
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
