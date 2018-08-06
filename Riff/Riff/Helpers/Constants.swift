//
//  Constants.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import Foundation

import UIKit

struct Constants {
    struct CustomString {
        static let Oops                             = "Oops"
        static let NoCamera                         = "Camera not available on this device!"
        static let NoPhotoLibrary                   = "Photo Library not available on this device!"
    }
    
    struct Environment {
        static let Production                       = "http://api.letsjoinpaws.org"
        static let QA                               = "http://api-staging.letsjoinpaws.org"
        static let Debug                            = "http://api-staging.letsjoinpaws.org"
    }
    
    struct NotificationKey {
        static let NewLocationReceived              = NSNotification.Name(rawValue: "NewLocationReceived")
        static let ReloadChannels                   = NSNotification.Name(rawValue: "ReloadChannels")
    }
    
    struct RiffKeys {
        static let riff                             = "riff"
        
        static let gender                           = "riff_gender"
        static let age                              = "riff_age"
        static let status                           = "riff_status"
        static let createdDate                      = "riff_createdDate"
        
        static let quotes                           = "quotes"
        static let text                             = "text"
        static let person                           = "person"
    }
}
