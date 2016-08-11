//
//  ListOfArtistsRouter.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ListOfArtistsRouterInput {
    func passDataToNextScene(segue: UIStoryboardSegue)
    func navigateArtistDetail(artist: Artist)
}

class ListOfArtistsRouter: ListOfArtistsRouterInput {
    weak var viewController: ListOfArtistsViewController!

    // MARK: - Navigation

    func navigateArtistDetail(artist: Artist) {
        let artistDetailViewController = try! Storyboard.ListOfArtists.ArtistDetailVC.instantiate()
        artistDetailViewController.output.artist = artist
        viewController.showViewController(artistDetailViewController, sender: self)
    }

    // MARK: - Communication

    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
    }
}
