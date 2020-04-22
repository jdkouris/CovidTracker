//
//  State.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import Foundation

struct State: Codable {
    let state: String
    let positive: Int
    let totalTestResults: Int
    let dateModified: Date
}
