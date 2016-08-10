//
//  ArtistDetailConfigurator.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ArtistDetailViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        router.passDataToNextScene(segue)
    }
}

class ArtistDetailConfigurator {

    // MARK: - Object lifecycle

    static let sharedInstance = ArtistDetailConfigurator()

    // MARK: - Configuration

    func configure(viewController: ArtistDetailViewController) {
        let router = ArtistDetailRouter()
        router.viewController = viewController

        let presenter = ArtistDetailPresenter()
        presenter.output = viewController

        let interactor = ArtistDetailInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
