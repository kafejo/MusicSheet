//
//  ArtistWorker.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

class ArtistWorker {
    let store: ArtistStoreProtocol

    init(store: ArtistStoreProtocol) {
        self.store = store
    }
}

protocol ArtistStoreProtocol {
    func fetchAllArtists(callback callback: [Artist] -> ())
}