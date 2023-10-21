class Userdata {
  bool? status;
  List<Data>? data;

  Userdata({this.status, this.data});

  Userdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Profile? profile;
  ContainerDesign? containerDesign;
  Dashboard? dashboard;
  String? sId;
  String? username;
  String? email;
  String? backgroundColor;
  String? website;
  String? font;
  String? googleToken;
  List<ContainerLinks>? containerLinks;
  List<dynamic>? mediaIcon;
  List<Product>? product;
  List<Messages>? messages;
  String? createdAt;
  String? productcardstyle;

  Data(
      {this.profile,
      this.containerDesign,
      this.dashboard,
      this.sId,
      this.username,
      this.email,
      this.backgroundColor,
      this.website,
      this.font,
      this.googleToken,
      this.containerLinks,
      this.mediaIcon,
      this.product,
      this.messages,
      this.createdAt,
      this.productcardstyle,
      
      
      });

  Data.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    containerDesign = json['container'] != null
        ?  ContainerDesign.fromJson(json['container'])
        : null;
    dashboard = json['dashboard'] != null
        ?  Dashboard.fromJson(json['dashboard'])
        : null;
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    backgroundColor = json['backgroundColor'];
    website = json['website'];
    font = json['font'];
    googleToken = json['googleToken'];
    if (json['containerLinks'] != null) {
      containerLinks = <ContainerLinks>[];
      json['containerLinks'].forEach((v) {
        containerLinks!.add( ContainerLinks.fromJson(v));
      });
    }
    // if (json['mediaIcon'] != null) {
    //   mediaIcon = <dynamic>[];
    //   json['mediaIcon'].forEach((v) {
    //     mediaIcon!.add( dynamic.fromJson(v));
    //   });
    // }
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add( Product.fromJson(v));
      });
    }
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add( Messages.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    productcardstyle = json['productcardstyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.containerDesign != null) {
      data['container'] = this.containerDesign!.toJson();
    }
    if (this.dashboard != null) {
      data['dashboard'] = this.dashboard!.toJson();
    }
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['backgroundColor'] = this.backgroundColor;
    data['website'] = this.website;
    data['font'] = this.font;
    data['googleToken'] = this.googleToken;
    if (this.containerLinks != null) {
      data['containerLinks'] =
          this.containerLinks!.map((v) => v.toJson()).toList();
    }
    if (this.mediaIcon != null) {
      data['mediaIcon'] = this.mediaIcon!.map((v) => v.toJson()).toList();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Profile {
  String? avatar;
  String? bio;
  String? bioColor;
  String? name;
  String? nameColor;

  Profile({this.avatar, this.bio, this.bioColor, this.name, this.nameColor});

  Profile.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    bio = json['bio'];
    bioColor = json['bioColor'];
    name = json['name'];
    nameColor = json['nameColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['bio'] = this.bio;
    data['bioColor'] = this.bioColor;
    data['name'] = this.name;
    data['nameColor'] = this.nameColor;
    return data;
  }
}

class ContainerDesign {
  String? containerColor;
  String? shape;
  String? borderColor;
  String? textColor;

  ContainerDesign(
      {this.containerColor, this.shape, this.borderColor, this.textColor});

  ContainerDesign.fromJson(Map<String, dynamic> json) {
    containerColor = json['containerColor'];
    shape = json['shape'];
    borderColor = json['borderColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['containerColor'] = this.containerColor;
    data['shape'] = this.shape;
    data['borderColor'] = this.borderColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class Dashboard {
  int? containerclick;
  int? productclick;
  int? websiteview;

  Dashboard({this.containerclick, this.productclick, this.websiteview});

  Dashboard.fromJson(Map<String, dynamic> json) {
    containerclick = json['containerclick'];
    productclick = json['productclick'];
    websiteview = json['websiteview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['containerclick'] = this.containerclick;
    data['productclick'] = this.productclick;
    data['websiteview'] = this.websiteview;
    return data;
  }
}

class ContainerLinks {
  String? name;
  String? link;
  bool? status;
  String? sId;
  String? createdAt;
  String? updatedAt;

  ContainerLinks(
      {this.name,
      this.link,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt});

  ContainerLinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['link'] = link;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Product {
  String? name;
  String? price;
  String? link;
  bool? status;
  String? image;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.name,
      this.price,
      this.link,
      this.status,
      this.image,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    link = json['link'];
    status = json['status'];
    image = json['image'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['link'] = this.link;
    data['status'] = this.status;
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Messages {
  String? name;
  String? email;
  String? title;
  String? message;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Messages(
      {this.name,
      this.email,
      this.title,
      this.message,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Messages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    title = json['title'];
    message = json['message'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['title'] = this.title;
    data['message'] = this.message;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}


































// // class Userdata {
  
// //  List? _data;
// //   List get data => _data!;

// //   Userdata({ required data}) {
// //   _data =data;
  
// //   }

// //    Userdata.fromJson(Map<String, dynamic> json, this._data) {
// //     if (json['data'] != null) {
// //       _data = <Data>[];
// //       json['data'].forEach((v) {
// //         _data?.add(Data.fromJson(v));
// //       });
// //     }
// //   }
// // }




// class Userdata {
//   bool? status;
//  List<Data> data = [];

//   Userdata({this.status, required this.data});

//   Userdata.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data.add( Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }




// class Data {
//   Profile? profile;
//   Container? container;
//   String? sId;
//   String? username;
//   String? email;
//   String? backgroundColor;
//   String? website;
//   String? font;
//   String? googleToken;
//   List<ContainerLinks>? containerLinks;
//   List<dynamic>? mediaIcon;
//   List<Product>? product;
//   List<Messages>? messages;
//   String? createdAt;

//   Data(
//       {this.profile,
//       this.container,
//       this.sId,
//       this.username,
//       this.email,
//       this.backgroundColor,
//       this.website,
//       this.font,
//       this.googleToken,
//       this.containerLinks,
//       this.mediaIcon,
//       this.product,
//       this.messages,
//       this.createdAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     profile =
//         json['profile'] != null ?  Profile.fromJson(json['profile']) : null;
//     container = json['container'] != null
//         ?  Container.fromJson(json['container'])
//         : null;
//     sId = json['_id'];
//     username = json['username'];
//     email = json['email'];
//     backgroundColor = json['backgroundColor'];
//     website = json['website'];
//     font = json['font'];
//     googleToken = json['googleToken'];
//     if (json['containerLinks'] != null) {
//       containerLinks = <ContainerLinks>[];
//       json['containerLinks'].forEach((v) {
//         containerLinks!.add(ContainerLinks.fromJson(v));
//       });
//     }
//     if (json['mediaIcon'] != null) {
//       mediaIcon = <dynamic>[];
//       // json['mediaIcon'].forEach((v) {
//       //   mediaIcon!.add(dynamic.fromJson(v));
//       // });
//     }
//     if (json['product'] != null) {
//       product = <Product>[];
//       json['product'].forEach((v) {
//         product!.add(new Product.fromJson(v));
//       });
//     }
//     if (json['messages'] != null) {
//       messages = <Messages>[];
//       json['messages'].forEach((v) {
//         messages!.add(new Messages.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.profile != null) {
//       data['profile'] = this.profile!.toJson();
//     }
//     if (this.container != null) {
//       data['container'] = this.container!.toJson();
//     }
//     data['_id'] = this.sId;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['backgroundColor'] = this.backgroundColor;
//     data['website'] = this.website;
//     data['font'] = this.font;
//     data['googleToken'] = this.googleToken;
//     if (this.containerLinks != null) {
//       data['containerLinks'] =
//           this.containerLinks!.map((v) => v.toJson()).toList();
//     }
//     if (this.mediaIcon != null) {
//       data['mediaIcon'] = this.mediaIcon!.map((v) => v.toJson()).toList();
//     }
//     if (this.product != null) {
//       data['product'] = this.product!.map((v) => v.toJson()).toList();
//     }
//     if (this.messages != null) {
//       data['messages'] = this.messages!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     return data;
//   }
// }

// class Profile {
//   String? name;
//   String? nameColor;
//   String? bio;
//   String? bioColor;
//   String? avatar;

//   Profile({this.name, this.nameColor, this.bio, this.bioColor, this.avatar});

//   Profile.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     nameColor = json['nameColor'];
//     bio = json['bio'];
//     bioColor = json['bioColor'];
//     avatar = json['avatar'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['nameColor'] = this.nameColor;
//     data['bio'] = this.bio;
//     data['bioColor'] = this.bioColor;
//     data['avatar'] = this.avatar;
//     return data;
//   }
// }

// class Container {
//   String? containerColor;
//   String? shape;
//   String? borderColor;
//   String? textColor;

//   Container(
//       {this.containerColor, this.shape, this.borderColor, this.textColor});

//   Container.fromJson(Map<String, dynamic> json) {
//     containerColor = json['containerColor'];
//     shape = json['shape'];
//     borderColor = json['borderColor'];
//     textColor = json['textColor'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['containerColor'] = this.containerColor;
//     data['shape'] = this.shape;
//     data['borderColor'] = this.borderColor;
//     data['textColor'] = this.textColor;
//     return data;
//   }
// }

// class ContainerLinks {
//   String? name;
//   String? link;
//   String? status;
//   String? sId;
//   String? createdAt;
//   String? updatedAt;

//   ContainerLinks(
//       {this.name,
//       this.link,
//       this.status,
//       this.sId,
//       this.createdAt,
//       this.updatedAt});

//   ContainerLinks.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     link = json['link'];
//     status = json['status'];
//     sId = json['_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['link'] = this.link;
//     data['status'] = this.status;
//     data['_id'] = this.sId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }

// class Product {
//   String? name;
//   String? price;
//   String? link;
//   String? status;
//   String? image;
//   String? sId;
//   String? createdAt;
//   String? updatedAt;

//   Product(
//       {this.name,
//       this.price,
//       this.link,
//       this.status,
//       this.image,
//       this.sId,
//       this.createdAt,
//       this.updatedAt});

//   Product.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     price = json['price'];
//     link = json['link'];
//     status = json['status'];
//     image = json['image'];
//     sId = json['_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['link'] = this.link;
//     data['status'] = this.status;
//     data['image'] = this.image;
//     data['_id'] = this.sId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }

// class Messages {
//   String? name;
//   String? email;
//   String? title;
//   String? message;
//   String? sId;
//   String? createdAt;
//   String? updatedAt;

//   Messages(
//       {this.name,
//       this.email,
//       this.title,
//       this.message,
//       this.sId,
//       this.createdAt,
//       this.updatedAt});

//   Messages.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//     title = json['title'];
//     message = json['message'];
//     sId = json['_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['title'] = this.title;
//     data['message'] = this.message;
//     data['_id'] = this.sId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
