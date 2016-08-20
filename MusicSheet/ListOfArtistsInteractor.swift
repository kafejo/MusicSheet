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
    var worker: ListOfArtistsWorker! = ArtistStore()


    var fetchedArtists: [Artist] = []

    // MARK: - Business logic

    func fetchArtistsOnLoad(request: ListOfArtistsRequest) {
        worker.fetchAllArtists { response in
            switch response {
            case .Success(let artists):
                let sortedArtists = self.sortArtists(artists, order: request.order)
                let response = ListOfArtistsResponse(artists: sortedArtists)

                self.fetchedArtists = sortedArtists
                self.output.presentArtists(response)
            case .Failure(_):
                // TODO: Handle error
                break
            }
        }
    }

    // MAKR: - Private methods

    func sortArtists(artists: [Artist], order: ListOfArtistsRequest.Order) -> [Artist] {
        switch order {
        case .Alphabetically:
            return artists.sort { $0.name < $1.name }
        }
    }
}
