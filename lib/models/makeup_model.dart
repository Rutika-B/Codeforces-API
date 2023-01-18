/// id : 495
/// brand : "maybelline"
/// name : "Maybelline Face Studio Master Hi-Light Light Booster Bronzer"
/// price : "14.99"
/// price_sign : null
/// currency : null
/// image_link : "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png"
/// product_link : "https://well.ca/products/maybelline-face-studio-master_88837.html"
/// website_link : "https://well.ca"
/// description : "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert \nbalance of shade + shimmer illuminator for natural glow. Skin goes \nsoft-lit with zero glitz.\n\n\t\tFor Best Results: Brush over all shades in palette and gently sweep over \ncheekbones, brow bones, and temples, or anywhere light naturally touches\n the face.\n\n\t\t\n\t\n\n                    "
/// rating : 5.0
/// category : null
/// product_type : "bronzer"
/// tag_list : []
/// created_at : "2016-10-01T18:36:15.012Z"
/// updated_at : "2017-12-23T21:08:50.624Z"
/// product_api_url : "https://makeup-api.herokuapp.com/api/v1/products/495.json"
/// api_featured_image : "//s3.amazonaws.com/donovanbailey/products/api_featured_images/000/000/495/original/open-uri20171223-4-9hrto4?1514063330"
/// product_colors : []

class MakeupModel {
  MakeupModel({
    num? id,
    String? brand,
    String? name,
    String? price,
    dynamic priceSign,
    dynamic currency,
    String? imageLink,
    String? productLink,
    String? websiteLink,
    String? description,
    num? rating,
    dynamic category,
    String? productType,
    List<dynamic>? tagList,
    String? createdAt,
    String? updatedAt,
    String? productApiUrl,
    String? apiFeaturedImage,
    List<dynamic>? productColors,
  }) {
    _id = id;
    _brand = brand;
    _name = name;
    _price = price;
    _priceSign = priceSign;
    _currency = currency;
    _imageLink = imageLink;
    _productLink = productLink;
    _websiteLink = websiteLink;
    _description = description;
    _rating = rating;
    _category = category;
    _productType = productType;
    _tagList = tagList;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productApiUrl = productApiUrl;
    _apiFeaturedImage = apiFeaturedImage;
    _productColors = productColors;
  }

  MakeupModel.fromJson(dynamic json) {
    _id = json['id'];
    _brand = json['brand'];
    _name = json['name'];
    _price = json['price'];
    _priceSign = json['price_sign'];
    _currency = json['currency'];
    _imageLink = json['image_link'];
    _productLink = json['product_link'];
    _websiteLink = json['website_link'];
    _description = json['description'];
    _rating = json['rating'];
    _category = json['category'];
    _productType = json['product_type'];
    // if (json['tag_list'] != null) {
    //   _tagList = [];
    //   json['tag_list'].forEach((v) {
    //     _tagList?.add(Dynamic.fromJson(v));
    //   });
    // }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _productApiUrl = json['product_api_url'];
    _apiFeaturedImage = json['api_featured_image'];
    // if (json['product_colors'] != null) {
    //   _productColors = [];
    //   json['product_colors'].forEach((v) {
    //     _productColors?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  num? _id;
  String? _brand;
  String? _name;
  String? _price;
  dynamic _priceSign;
  dynamic _currency;
  String? _imageLink;
  String? _productLink;
  String? _websiteLink;
  String? _description;
  num? _rating;
  dynamic _category;
  String? _productType;
  List<dynamic>? _tagList;
  String? _createdAt;
  String? _updatedAt;
  String? _productApiUrl;
  String? _apiFeaturedImage;
  List<dynamic>? _productColors;
  MakeupModel copyWith({
    num? id,
    String? brand,
    String? name,
    String? price,
    dynamic priceSign,
    dynamic currency,
    String? imageLink,
    String? productLink,
    String? websiteLink,
    String? description,
    num? rating,
    dynamic category,
    String? productType,
    List<dynamic>? tagList,
    String? createdAt,
    String? updatedAt,
    String? productApiUrl,
    String? apiFeaturedImage,
    List<dynamic>? productColors,
  }) =>
      MakeupModel(
        id: id ?? _id,
        brand: brand ?? _brand,
        name: name ?? _name,
        price: price ?? _price,
        priceSign: priceSign ?? _priceSign,
        currency: currency ?? _currency,
        imageLink: imageLink ?? _imageLink,
        productLink: productLink ?? _productLink,
        websiteLink: websiteLink ?? _websiteLink,
        description: description ?? _description,
        rating: rating ?? _rating,
        category: category ?? _category,
        productType: productType ?? _productType,
        tagList: tagList ?? _tagList,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        productApiUrl: productApiUrl ?? _productApiUrl,
        apiFeaturedImage: apiFeaturedImage ?? _apiFeaturedImage,
        productColors: productColors ?? _productColors,
      );
  num? get id => _id;
  String? get brand => _brand;
  String? get name => _name;
  String? get price => _price;
  dynamic get priceSign => _priceSign;
  dynamic get currency => _currency;
  String? get imageLink => _imageLink;
  String? get productLink => _productLink;
  String? get websiteLink => _websiteLink;
  String? get description => _description;
  num? get rating => _rating;
  dynamic get category => _category;
  String? get productType => _productType;
  List<dynamic>? get tagList => _tagList;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get productApiUrl => _productApiUrl;
  String? get apiFeaturedImage => _apiFeaturedImage;
  List<dynamic>? get productColors => _productColors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brand'] = _brand;
    map['name'] = _name;
    map['price'] = _price;
    map['price_sign'] = _priceSign;
    map['currency'] = _currency;
    map['image_link'] = _imageLink;
    map['product_link'] = _productLink;
    map['website_link'] = _websiteLink;
    map['description'] = _description;
    map['rating'] = _rating;
    map['category'] = _category;
    map['product_type'] = _productType;
    if (_tagList != null) {
      map['tag_list'] = _tagList?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['product_api_url'] = _productApiUrl;
    map['api_featured_image'] = _apiFeaturedImage;
    if (_productColors != null) {
      map['product_colors'] = _productColors?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
