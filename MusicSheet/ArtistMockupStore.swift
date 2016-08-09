//
//  ArtistMockupStore.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

class ArtistMockupStore: ArtistStoreProtocol {
    func fetchAllArtists(callback callback: [Artist] -> ()) {
        let mockupArtists = [
            Artist(name: "Britney Spears", numberOfAlbums: 14),
            Artist(name: "Beyonce", numberOfAlbums: 10),
            Artist(name: "Jenifer Lopez", numberOfAlbums: 4),
            Artist(name: "Madonna", numberOfAlbums: 20)
        ]
        callback(mockupArtists)
    }
}
