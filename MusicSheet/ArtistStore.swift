//
//  ArtistStore.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 20/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

class ArtistStore { }

// MARK: - ArtistDetailWorker

extension ArtistStore: ArtistDetailWorker {
    func fetchArtistInfo(artist artist: Artist, callback: [Album] -> ()) {
        // TODO: -
    }
}

// MARK: - ListOfArtistsWorker

extension ArtistStore: ListOfArtistsWorker {
    func fetchAllArtists(callback callback: Result<[Artist]> -> ()) {
        ArtistService.artists { result in
            switch result {
            case .Success(let artists):
                // This is the best place to persist fetched artists
                // TODO: - persist them
                callback(Result.Success(artists))
            case .Failure(_):
                // Just forward failure or transform it into another error
                callback(result)
            }
        }
    }
}
