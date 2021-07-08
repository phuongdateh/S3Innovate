//
//  Cache.swift
//  NetworkLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation
import RxSwift
import RealmSwift

protocol AbstractCache {
    associatedtype T
    func save(object: T) -> Completable
    func save(objects: [T]) -> Completable
    func fetch(withID id: String) -> Maybe<T>
    func fetchObjects() -> Maybe<[T]>
}

public class Cache<T: Decodable>: AbstractCache {
    func save(object: T) -> Completable {
        return Completable.create { obserer in
            
            
            
            return Disposables.create()
        }.subscribe(on: cacheScheduler)
    }
    
    func save(objects: [T]) -> Completable {
        return Completable.create { obserer in
            
            return Disposables.create()
        }.subscribe(on: cacheScheduler)
    }
    
    func fetch(withID id: String) -> Maybe<T> {
        return Maybe.create { obserer in
            
            return Disposables.create()
        }.subscribe(on: cacheScheduler)
    }
    
    func fetchObjects() -> Maybe<[T]> {
        return Maybe.create { obserer in
            
            return Disposables.create()
        }.subscribe(on: cacheScheduler)
    }
    
    private let cacheScheduler = SerialDispatchQueueScheduler(internalSerialQueueName: "com.CleanAchitecture.Network.Cache.queue")
    
    func save() {
        
    }
}

extension Decodable {
    func cache() {
        
    }
}
