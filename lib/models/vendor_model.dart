class Vendor {
  String firstName;
  String channelName;
  String id;
  String regionId;
  String name;
  String phone;
  String currency;
  String currencyCode;
  String desc;
  bool isActive;
  List<String> images;
  String industryId;
  double distance;
  String webSite;

  Address address;
  Rating rating;
  String tags;
  SocialMediaAcounts socialMediaAcounts;
  dynamic communityIcons;
  int views;
  int shares;
  String channelId;
  int followersCount;
  bool isAddressHideToCustomer;

  Vendor(
      {required this.firstName,
      required this.id,
      required this.regionId,
      required this.name,
      required this.phone,
      required this.currency,
      required this.currencyCode,
      required this.desc,
      required this.isActive,
      required this.images,
      required this.industryId,
      required this.distance,
      required this.webSite,
      required this.address,
      required this.rating,
      required this.tags,
      required this.socialMediaAcounts,
      this.communityIcons,
      required this.views,
      required this.shares,
      required this.channelId,
      required this.followersCount,
      required this.isAddressHideToCustomer,
      required this.channelName});

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
      id: json["id"] ?? '',
      regionId: json["regionId"] ?? '',
      name: json["name"] ?? '',
      phone: json["phone"] ?? '',
      currency: json["currency"] ?? '',
      currencyCode: json["currencyCode"] ?? '',
      desc: json["desc"] ?? '',
      isActive: json["isActive"] ?? false,
      images: json["images"] != null ? List<String>.from(json["images"].map((x) => x)) : [],
      industryId: json["industryId"] ?? '',
      distance: json["distance"]?.toDouble() ?? 0.0,
      webSite: json["webSite"] ?? '',
      address: Address.fromJson(json["address"]),
      rating: Rating.fromJson(json["rating"]),
      tags: json["tags"] ?? '',
      socialMediaAcounts: json["socialMediaAcounts"] != null
          ? SocialMediaAcounts.fromJson(json["socialMediaAcounts"])
          : SocialMediaAcounts(faceBook: '', instagram: '', twitter: '', youTube: ''),
      communityIcons: json["communityIcons"] ?? '',
      views: json["views"] ?? 0,
      shares: json["shares"] ?? 0,
      channelId: json["channelId"] ?? '',
      followersCount: json["followersCount"] ?? 0,
      isAddressHideToCustomer: json["isAddressHideToCustomer"] ?? false,
      firstName: json["firstName"] ?? '',
      channelName: json["channelName"] ?? '');
}

class Address {
  String id;
  String title;
  String number;
  String street;
  String city;
  String state;
  String zipcode;
  String country;
  double lat;
  double lon;

  Address({
    required this.id,
    required this.title,
    required this.number,
    required this.street,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        number: json["number"] ?? '',
        street: json["street"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        zipcode: json["zipcode"] ?? '',
        country: json["country"] ?? '',
        lat: json["lat"]?.toDouble() ?? 0,
        lon: json["lon"]?.toDouble() ?? 0,
      );
}

class Rating {
  int count;
  int value;
  String label;
  String colour;

  Rating({
    required this.count,
    required this.value,
    required this.label,
    required this.colour,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        count: json["count"] ?? 0,
        value: json["value"] ?? 0,
        label: json["label"] ?? '',
        colour: json["colour"] ?? '',
      );
}

class SocialMediaAcounts {
  String faceBook;
  String instagram;
  String twitter;
  String youTube;

  SocialMediaAcounts({
    required this.faceBook,
    required this.instagram,
    required this.twitter,
    required this.youTube,
  });

  factory SocialMediaAcounts.fromJson(Map<String, dynamic> json) => SocialMediaAcounts(
        faceBook: json["faceBook"] ?? '',
        instagram: json["instagram"] ?? '',
        twitter: json["twitter"] ?? '',
        youTube: json["youTube"] ?? '',
      );
}
