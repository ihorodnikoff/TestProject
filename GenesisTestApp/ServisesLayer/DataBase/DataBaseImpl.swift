//
//  DataBaseImpl.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import RealmSwift

final class DatabaseImpl {
  private let realm: Realm
  
  init(realm: Realm = try! Realm()) {
    self.realm = realm
  }
  
  func createOrUpdate<Model, RealmObject: Object>(model: Model,
                                                  with reverseTransformer: (Model) -> RealmObject) {
    let object = reverseTransformer(model)
    try! realm.write {
      realm.add(object, update: true)
    }
  }
  
  func fetch<Model, RealmObject>(with request: FetchRequest<Model, RealmObject>) -> Model {
    let results = realm.objects(RealmObject.self)
    return request.transformer(results)
  }
  
  func delete<RealmObject: Object>(type: RealmObject.Type,
                                   with primaryKey: String) {
    let object = realm.object(ofType: type,
                              forPrimaryKey: primaryKey)
    if let object = object {
      try! realm.write {
        realm.delete(object)
      }
    }
  }
  
  func deleteAllObjectsOfType<RealmObject: Object>(_ type: RealmObject.Type) {
    let objects = realm.objects(type)
    try! realm.write {
      realm.delete(objects)
    }
  }
  
  func deleteAll() {
    try! realm.write {
      realm.deleteAll()
    }
  }
}

extension DatabaseImpl: DataBase {}
