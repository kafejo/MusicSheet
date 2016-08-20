//
//  ArtistMockupStore.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

class ArtistMockupStore {
    static let MockupArtists = [
        Artist(name: "Britney Spears", numberOfAlbums: 14),
        Artist(name: "Jenifer Lopez", numberOfAlbums: 4),
        Artist(name: "Beyonce", numberOfAlbums: 10),
        Artist(name: "Madonna", numberOfAlbums: 20)
    ]

    static let Albums = [
        Album(name: "Rebel Heart", releaseDate: NSDate(timeIntervalSince1970: 1439197919), numberOfTracks: 19),
        Album(name: "True Blue", releaseDate: NSDate(timeIntervalSince1970: 524049119), numberOfTracks: 9)
    ]
}

// MARK: - ArtistStoreProtocol

extension ArtistMockupStore: ArtistDetailWorker {
    func fetchArtistInfo(artist artist: Artist, callback: [Album] -> ()) {
        callback(ArtistMockupStore.Albums)
    }
}

extension ArtistMockupStore: ListOfArtistsWorker {
    func fetchAllArtists(callback callback: [Artist] -> ()) {
        callback(ArtistMockupStore.MockupArtists)
    }
}
