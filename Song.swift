//
//  Song.swift
//  BeatBuddy
//
//  Created by Pranav Motarwar on 26/06/24.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
}

