//
//  DisposeBase.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

/// Base class for all disposables.
public class DisposeBase {
  init() {
    #if TRACE_RESOURCES
    _ = Resources.incrementTotal()
    #endif
  }
  
  deinit {
    #if TRACE_RESOURCES
    _ = Resources.decrementTotal()
    #endif
  }
}
