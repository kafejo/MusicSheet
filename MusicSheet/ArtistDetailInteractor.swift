//
//  ArtistDetailInteractor.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ArtistDetailInteractorOutput {
    func presentArtistDetails(response: ArtistDetailResponse)
}

class ArtistDetailInteractor: ArtistDetailViewControllerOutput {
    var output: ArtistDetailInteractorOutput!
    var worker: ArtistWorker! = ArtistWorker(store: ArtistMockupStore())

    var artist: Artist!

    // MARK: - Business logic

    func fetchArtistDetailsOnLoad() {
        // Load all things for artist we need (for example albums, related artists)
        worker.store.fetchArtistInfo(artist: artist) { albums in
            let response = ArtistDetailResponse(albums: albums)
            self.output.presentArtistDetails(response)
        }
    }

}
