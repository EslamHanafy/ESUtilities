//
//  ESQueue.swift
//  ESUtilities
//
//  Created by Eslam on 9/8/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import Foundation




/// delay tasks for time in seconds
///
/// - Parameters:
///   - time: the delay value in seconds
///   - execute: the code that you want to execute
public func ESDelay(forTime time: Double, execute: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: execute)
}

/// execute the code in the main queue
///
/// - Parameter execute: the code that ypu want to execute
public func ESMainQueue(_ execute: @escaping ()->()){
    DispatchQueue.main.async(execute: execute)
}


/// execute the code in another queue
///
/// - Parameters:
///   - qos: the queue priority, default is .background priority
///   - execute: the code that ypu want to execute
public func ESQueue(withQOS qos:DispatchQoS.QoSClass = .background, _ execute: @escaping ()->()){
    DispatchQueue.global(qos: qos).async(execute: execute)
}
