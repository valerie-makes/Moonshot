//
//  ContentView.swift
//  Moonshot
//
//  Created by David Bailey on 05/06/2021.
//

import SwiftUI

struct ContentView: View {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(Self.missions) { mission in
                NavigationLink(
                    destination: MissionView(
                        mission: mission,
                        missions: Self.missions,
                        astronauts: Self.astronauts
                    )
                ) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
