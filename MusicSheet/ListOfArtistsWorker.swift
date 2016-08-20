//
//  ListOfArtistsWorker.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 14/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.
//

import UIKit

protocol ListOfArtistsWorker {
    func fetchAllArtists(callback callback: Result<[Artist]> -> ())
}