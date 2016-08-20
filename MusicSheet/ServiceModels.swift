//
//  Result.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 20/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation

enum Result<T> {
    case Success(T)
    case Failure(ErrorType)
}

enum ServiceError: ErrorType {
    case UnableToParseJSON
}
