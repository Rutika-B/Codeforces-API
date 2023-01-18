/// status : "OK"
/// result : [{"lastName":"Khodyrev","lastOnlineTimeSeconds":1667320341,"rating":1709,"friendOfCount":92,"titlePhoto":"https://userpic.codeforces.org/1592/title/27e43714e4bea090.jpg","handle":"DmitriyH","avatar":"https://userpic.codeforces.org/1592/avatar/7cef566902732053.jpg","firstName":"Dmitriy","contribution":1,"organization":"","rank":"expert","maxRating":2072,"registrationTimeSeconds":1268570311,"maxRank":"candidate master"},{"lastName":"Fefer","country":"Russia","lastOnlineTimeSeconds":1672070012,"city":"Saratov","rating":2174,"friendOfCount":385,"titlePhoto":"https://userpic.codeforces.org/242/title/151ab49dee0779f8.jpg","handle":"Fefer_Ivan","avatar":"https://userpic.codeforces.org/242/avatar/c4e6a102a9e66281.jpg","firstName":"Ivan","contribution":0,"organization":"Booking.com","rank":"master","maxRating":2476,"registrationTimeSeconds":1264960450,"maxRank":"grandmaster"}]

class UserInfoModel {
  UserInfoModel({
    String? status,
    List<Result>? result,
  }) {
    _status = status;
    _result = result;
  }

  UserInfoModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  String? _status;
  List<Result>? _result;
  UserInfoModel copyWith({
    String? status,
    List<Result>? result,
  }) =>
      UserInfoModel(
        status: status ?? _status,
        result: result ?? _result,
      );
  String? get status => _status;
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// lastName : "Khodyrev"
/// lastOnlineTimeSeconds : 1667320341
/// rating : 1709
/// friendOfCount : 92
/// titlePhoto : "https://userpic.codeforces.org/1592/title/27e43714e4bea090.jpg"
/// handle : "DmitriyH"
/// avatar : "https://userpic.codeforces.org/1592/avatar/7cef566902732053.jpg"
/// firstName : "Dmitriy"
/// contribution : 1
/// organization : ""
/// rank : "expert"
/// maxRating : 2072
/// registrationTimeSeconds : 1268570311
/// maxRank : "candidate master"

class Result {
  Result({
    String? lastName,
    num? lastOnlineTimeSeconds,
    num? rating,
    num? friendOfCount,
    String? titlePhoto,
    String? handle,
    String? avatar,
    String? firstName,
    num? contribution,
    String? organization,
    String? rank,
    num? maxRating,
    num? registrationTimeSeconds,
    String? maxRank,
  }) {
    _lastName = lastName;
    _lastOnlineTimeSeconds = lastOnlineTimeSeconds;
    _rating = rating;
    _friendOfCount = friendOfCount;
    _titlePhoto = titlePhoto;
    _handle = handle;
    _avatar = avatar;
    _firstName = firstName;
    _contribution = contribution;
    _organization = organization;
    _rank = rank;
    _maxRating = maxRating;
    _registrationTimeSeconds = registrationTimeSeconds;
    _maxRank = maxRank;
  }

  Result.fromJson(dynamic json) {
    _lastName = json['lastName'];
    _lastOnlineTimeSeconds = json['lastOnlineTimeSeconds'];
    _rating = json['rating'];
    _friendOfCount = json['friendOfCount'];
    _titlePhoto = json['titlePhoto'];
    _handle = json['handle'];
    _avatar = json['avatar'];
    _firstName = json['firstName'];
    _contribution = json['contribution'];
    _organization = json['organization'];
    _rank = json['rank'];
    _maxRating = json['maxRating'];
    _registrationTimeSeconds = json['registrationTimeSeconds'];
    _maxRank = json['maxRank'];
  }
  String? _lastName;
  num? _lastOnlineTimeSeconds;
  num? _rating;
  num? _friendOfCount;
  String? _titlePhoto;
  String? _handle;
  String? _avatar;
  String? _firstName;
  num? _contribution;
  String? _organization;
  String? _rank;
  num? _maxRating;
  num? _registrationTimeSeconds;
  String? _maxRank;
  Result copyWith({
    String? lastName,
    num? lastOnlineTimeSeconds,
    num? rating,
    num? friendOfCount,
    String? titlePhoto,
    String? handle,
    String? avatar,
    String? firstName,
    num? contribution,
    String? organization,
    String? rank,
    num? maxRating,
    num? registrationTimeSeconds,
    String? maxRank,
  }) =>
      Result(
        lastName: lastName ?? _lastName,
        lastOnlineTimeSeconds: lastOnlineTimeSeconds ?? _lastOnlineTimeSeconds,
        rating: rating ?? _rating,
        friendOfCount: friendOfCount ?? _friendOfCount,
        titlePhoto: titlePhoto ?? _titlePhoto,
        handle: handle ?? _handle,
        avatar: avatar ?? _avatar,
        firstName: firstName ?? _firstName,
        contribution: contribution ?? _contribution,
        organization: organization ?? _organization,
        rank: rank ?? _rank,
        maxRating: maxRating ?? _maxRating,
        registrationTimeSeconds:
            registrationTimeSeconds ?? _registrationTimeSeconds,
        maxRank: maxRank ?? _maxRank,
      );
  String? get lastName => _lastName;
  num? get lastOnlineTimeSeconds => _lastOnlineTimeSeconds;
  num? get rating => _rating;
  num? get friendOfCount => _friendOfCount;
  String? get titlePhoto => _titlePhoto;
  String? get handle => _handle;
  String? get avatar => _avatar;
  String? get firstName => _firstName;
  num? get contribution => _contribution;
  String? get organization => _organization;
  String? get rank => _rank;
  num? get maxRating => _maxRating;
  num? get registrationTimeSeconds => _registrationTimeSeconds;
  String? get maxRank => _maxRank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lastName'] = _lastName;
    map['lastOnlineTimeSeconds'] = _lastOnlineTimeSeconds;
    map['rating'] = _rating;
    map['friendOfCount'] = _friendOfCount;
    map['titlePhoto'] = _titlePhoto;
    map['handle'] = _handle;
    map['avatar'] = _avatar;
    map['firstName'] = _firstName;
    map['contribution'] = _contribution;
    map['organization'] = _organization;
    map['rank'] = _rank;
    map['maxRating'] = _maxRating;
    map['registrationTimeSeconds'] = _registrationTimeSeconds;
    map['maxRank'] = _maxRank;
    return map;
  }
}
