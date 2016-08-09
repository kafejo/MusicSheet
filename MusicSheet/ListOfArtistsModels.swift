//
//  ListOfArtistsModels.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

struct ListOfArtistsRequest {

    enum Order {
        case Alphabetically
    }

    let order: Order
}

struct ListOfArtistsResponse {
    let artists: [Artist]
}

struct ListOfArtistsViewModel {
    let artistsViewModels: [ArtistViewModel]
}

struct ArtistViewModel {
    let title: String
}
