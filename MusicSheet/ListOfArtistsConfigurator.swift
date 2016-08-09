//
//  ListOfArtistsConfigurator.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ListOfArtistsViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        router.passDataToNextScene(segue)
    }
}

class ListOfArtistsConfigurator {

    // MARK: - Object lifecycle

    static let sharedInstance = ListOfArtistsConfigurator()

    // MARK: - Configuration

    func configure(viewController: ListOfArtistsViewController) {
        let router = ListOfArtistsRouter()
        router.viewController = viewController

        let presenter = ListOfArtistsPresenter()
        presenter.output = viewController

        let interactor = ListOfArtistsInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
