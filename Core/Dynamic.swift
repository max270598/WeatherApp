//
//  Dynamic.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public class Dynamic<T> {
   public typealias Listener = (T) -> ()
    
   public var listener: Listener?
    
   public var value: T {
        didSet {
            listener?(value)
        }
    }
    
   public func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
   public func Update()  {
        self.listener!(value)
    }
    
   public init(_ value: T) {
        self.value = value
    }
}
