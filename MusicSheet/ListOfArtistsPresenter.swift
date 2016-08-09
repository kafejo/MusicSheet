//
//  ListOfArtistsPresenter.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ListOfArtistsPresenterOutput: class {
    func displayArtists(viewModel viewModel: ListOfArtistsViewModel)
}

class ListOfArtistsPresenter: ListOfArtistsInteractorOutput {
    weak var output: ListOfArtistsPresenterOutput?

    // MARK: - Presentation logic

    func presentArtists(response: ListOfArtistsResponse) {

        let artistsViewModels: [ArtistViewModel] = response.artists.map { artist in
            return ArtistViewModel(title: "\(artist.name) - \(artist.numberOfAlbums)")
        }

        output?.displayArtists(viewModel: ListOfArtistsViewModel(artistsViewModels: artistsViewModels))
    }
}
