//
//  ArtistService.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 20/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import Foundation
import Unbox

class ArtistService {
    class func artists(completion: Result<[Artist]> -> Void) {
        // Do work on background - Download JSON from internet
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
            let jsonPath = NSBundle.mainBundle().pathForResource("artists", ofType: "json")
            let artists: [Artist]? = {
                do {
                    let json = try String(contentsOfFile: jsonPath!)
                    return try Unbox(json.dataUsingEncoding(NSUTF8StringEncoding)!)
                } catch {
                    return nil
                }
            }()
            // Get back to main queue and call completion with results
            dispatch_async(dispatch_get_main_queue(), {
                if let artists = artists {
                    completion(Result.Success(artists))
                } else {
                    completion(Result.Failure(ServiceError.UnableToParseJSON))
                }
            })
        }
    }
}
