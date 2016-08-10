//
//  ArtistDetailPresenter.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ArtistDetailPresenterOutput: class {
    func displayArtistDetails(viewModel: ArtistDetailViewModel)
}

class ArtistDetailPresenter: ArtistDetailInteractorOutput {
    weak var output: ArtistDetailPresenterOutput?

    private(set) lazy var dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy", options: 0, locale: nil)
        return dateFormatter
    }()

    // MARK: - Presentation logic

    func presentArtistDetails(response: ArtistDetailResponse) {
        let albumViewModels: [ArtistDetailAlbumViewModel] = response.albums.map { album in
            let title = "\(album.name) - \(dateFormatter.stringFromDate(album.releaseDate))"
            let description = String(format: NSLocalizedString("%d track(s)", comment: "Number of tracks in album format"), album.numberOfTracks)

            return ArtistDetailAlbumViewModel(title: title, description: description)
        }

        output?.displayArtistDetails(ArtistDetailViewModel(albumsViewModels: albumViewModels))
    }

}
