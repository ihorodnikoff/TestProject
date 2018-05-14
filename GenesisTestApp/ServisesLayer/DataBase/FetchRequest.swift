//
//  FetchRequest.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import RealmSwift

struct FetchRequest<Model, RealmObject: Object> {
  let transformer: (Results<RealmObject>) -> Model
}
