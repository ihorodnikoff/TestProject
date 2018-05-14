//
//  DataBase.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import RealmSwift

protocol DataBase {
  func createOrUpdate<Model, RealmObject: Object>(model: Model,
                                                  with reverseTransformer: (Model) -> RealmObject)
  func fetch<Model, RealmObject>(with request: FetchRequest<Model, RealmObject>) -> Model
  func delete<RealmObject: Object>(type: RealmObject.Type,
                                   with primaryKey: String)
  func deleteAllObjectsOfType<RealmObject: Object>(_ type: RealmObject.Type)
  func deleteAll()
}
