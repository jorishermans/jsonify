// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of jsonify;

class JsonProperty {
  
  final String name;
  
  const JsonProperty(this.name);

}

class JsonIgnore {
  
  const JsonIgnore();

}

/// Checks if you are awesome. Spoiler: you are.
abstract class Jsonify {

  Map toJson() { 
    Map map = new Map();
    InstanceMirror im = reflect(this);
    ClassMirror cm = im.type;
    var decls = cm.declarations.values.where((dm) => dm is VariableMirror);
    decls.forEach((dm) {
      var key = MirrorSystem.getName(dm.simpleName);
      var val = im.getField(dm.simpleName).reflectee;
      bool ignore = false;
      for (InstanceMirror im in dm.metadata) {
        if (im.reflectee is JsonProperty) {
          JsonProperty jsonProperty = im.reflectee;
          key = jsonProperty.name;
        }
        if (im.reflectee is JsonIgnore) {
          ignore = true;
        }
      }
      if (!ignore && val != null) {
        map[key] = val;
      }
    });

    return map;
  }  

}
