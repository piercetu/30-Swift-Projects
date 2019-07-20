//
//  StopWatch.swift
//  StopWatch
//
//  Created by Pierce Tu on 7/17/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation

class StopWatch: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        counter = 0.0
        timer = Timer()
    }
    
}
