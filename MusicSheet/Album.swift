//
//  Album.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation
import Unbox

struct Album {
    let name: String
    let releaseDate: NSDate
    let numberOfTracks: Int
}

extension Album: Equatable { }

func ==(lhs: Album, rhs: Album) -> Bool {
    return lhs.name == rhs.name && lhs.numberOfTracks == rhs.numberOfTracks && lhs.releaseDate == rhs.releaseDate
}

extension Album: Unboxable {

    static let releaseDateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    init(unboxer: Unboxer) {
        name = unboxer.unbox("name")
        releaseDate = unboxer.unbox("release_date", formatter: Album.releaseDateFormatter)
        numberOfTracks = unboxer.unbox("number_of_tracks")
    }
}

