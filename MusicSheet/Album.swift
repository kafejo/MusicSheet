//
//  Album.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

struct Album {
    let name: String
    let releaseDate: NSDate
    let numberOfTracks: Int
}

extension Album: Equatable { }

func ==(lhs: Album, rhs: Album) -> Bool {
    return lhs.name == rhs.name && lhs.numberOfTracks == rhs.numberOfTracks && lhs.releaseDate == rhs.releaseDate
}
