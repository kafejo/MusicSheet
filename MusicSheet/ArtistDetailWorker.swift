//
//  ArtistDetailWorker.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 20/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ArtistDetailWorker {
    func fetchArtistInfo(artist artist: Artist, callback: [Album] -> ())
}
