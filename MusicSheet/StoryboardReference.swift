//
//  StoryboardReference.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol StoryboardType {
    static var name: String { get }
}

enum StoryboardReferenceError: ErrorType {
    case Invalid
}

struct StoryboardReference<S: StoryboardType, T> {
    let id: String

    func instantiate() throws -> T {
        if let controller = UIStoryboard(name: S.name, bundle: nil).instantiateViewControllerWithIdentifier(id) as? T {
            return controller
        } else {
            throw StoryboardReferenceError.Invalid
        }
    }
}

struct Storyboard {

    struct ListOfArtists: StoryboardType {
        static let name: String = "ListOfArtists"

        static let ListOfArtistsVC = StoryboardReference<ListOfArtists, ListOfArtistsViewController>(id: "ListOfArtistsViewControllerID")
        static let ArtistDetailVC = StoryboardReference<ListOfArtists, ArtistDetailViewController>(id: "ArtistDetailViewControllerID")
    }
}


