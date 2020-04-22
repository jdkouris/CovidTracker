//
//  CTError.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import Foundation

enum CTError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
