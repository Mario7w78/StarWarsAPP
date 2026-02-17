//
//  DependencyContainer.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


import SwiftUI

@propertyWrapper
struct DependencyContainer<Value>: DynamicProperty {
    @EnvironmentObject private var dependencyContainer: DependencyInjector
    private let key: ReferenceWritableKeyPath<DependencyInjector, Value>
    
    init(_ key: ReferenceWritableKeyPath<DependencyInjector, Value>) {
        self.key = key
    }
    
    var wrappedValue: Value {
        get { dependencyContainer[keyPath: key] }
        nonmutating set { dependencyContainer[keyPath: key] = newValue }
    }
}
