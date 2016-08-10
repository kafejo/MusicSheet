//
//  ArtistDetailModels.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

struct ArtistDetailRequest {
}

struct ArtistDetailResponse {
    let albums: [Album]
}

struct ArtistDetailViewModel {
    let albumsViewModels: [ArtistDetailAlbumViewModel]
}

struct ArtistDetailAlbumViewModel {
    let title: String
    let description: String
}
