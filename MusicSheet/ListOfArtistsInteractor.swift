//
//  ListOfArtistsInteractor.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ListOfArtistsInteractorOutput {
    func presentArtists(response: ListOfArtistsResponse)
}

class ListOfArtistsInteractor: ListOfArtistsViewControllerOutput {
    var output: ListOfArtistsInteractorOutput!
    var worker: ArtistWorker! = ArtistWorker(store: ArtistMockupStore())

    // MARK: - Business logic

    func fetchArtistsOnLoad(request: ListOfArtistsRequest) {
        worker.store.fetchAllArtists { artists in
            let response = ListOfArtistsResponse(artists: artists)
            self.output.presentArtists(response)
        }
    }
}
