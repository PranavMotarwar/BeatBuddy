//
//  ContentView.swift
//  BeatBuddy
//
//  Created by Pranav Motarwar on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SongViewModel()
    @State private var selectedSong: Song?

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.songs) { song in
                    Button(action: {
                        selectedSong = song
                        viewModel.getRecommendations(for: song.title)
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(song.title)
                                    .font(.headline)
                                Text(song.artist)
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
                
                if let song = selectedSong {
                    Text("Recommendations for \(song.title)")
                        .font(.title2)
                        .padding()
                    
                    List(viewModel.recommendations, id: \.self) { recommendation in
                        Text(recommendation)
                            .padding()
                    }
                }
            }
            .navigationTitle("Spotify Clone")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
