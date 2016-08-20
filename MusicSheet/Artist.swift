//
//  Artist.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation
import Unbox

struct Artist {
    let name: String
    let numberOfAlbums: Int
}

extension Artist: Equatable { }

func ==(lhs: Artist, rhs: Artist) -> Bool {
    return lhs.name == rhs.name && lhs.numberOfAlbums == rhs.numberOfAlbums
}

extension Artist: Unboxable {
    init(unboxer: Unboxer) {
        name = unboxer.unbox("name")
        numberOfAlbums = unboxer.unbox("number_of_albums")
    }
}