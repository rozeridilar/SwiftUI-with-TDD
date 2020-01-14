//
//  Cache.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/9/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//
//https://www.swiftbysundell.com/articles/caching-in-swift/
import Foundation
//The first thing we’ll do is to declare our new cache type. Let’s call it Cache, and make it a generic over any Hashable key type, and any value type. We’ll then give it an NSCache property, which will store Entry instances keyed by a WrappedKey type:

//Here we are using QuizModel class to cache, hence we can cache it as infrequently as we can.
final class Cache<Key: Hashable, Value> {
    private let wrapped = NSCache<WrappedKey, Entry>()

    func insert(_ value: Value, forKey key: Key) {
        let entry = Entry(value: value)
        wrapped.setObject(entry, forKey: WrappedKey(key))
    }

    func value(forKey key: Key) -> Value? {
        let entry = wrapped.object(forKey: WrappedKey(key))
        return entry?.value
    }

    func removeValue(forKey key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
}

//Our WrappedKey type will, like its name suggests, wrap our public-facing Key values in order to make them NSCache compatible. To achieve that, let’s subclass NSObject and implement hash and isEqual — since that’s what Objective-C uses to determine whether two instances are equal:
private extension Cache {
    final class WrappedKey: NSObject {
        let key: Key

        init(_ key: Key) { self.key = key }

        override var hash: Int { return key.hashValue }

        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }

            return value.key == key
        }
    }
}

//When it comes to our Entry type, the only requirement is that it needs to be a class (it doesn’t need to subclass NSObject), which means that we can simply make it store a Value instance:
private extension Cache {
    final class Entry {
        let value: Value

        init(value: Value) {
            self.value = value
        }
    }
}

//Since a cache is essentially just a specialized key-value store, it’s an ideal use case for subscripting — so let’s also make it possible to both retrieve and insert values that way:
extension Cache {
    subscript(key: Key) -> Value? {
        get { return value(forKey: key) }
        set {
            guard let value = newValue else {
                // If nil was assigned using our subscript,
                // then we remove any value for that key:
                removeValue(forKey: key)
                return
            }

            insert(value, forKey: key)
        }
    }
}
