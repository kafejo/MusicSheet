//
//  Artist.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

struct Artist {
    let name: String
    let numberOfAlbums: Int
}

extension Artist: Equatable { }

func ==(lhs: Artist, rhs: Artist) -> Bool {
    return lhs.name == rhs.name && lhs.numberOfAlbums == rhs.numberOfAlbums
}

