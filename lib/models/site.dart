import 'dart:ffi';

import 'package:casanareapp/models/cities.model.dart';
import 'package:casanareapp/models/site_type.dart';

class Site {
  String businessId;

  String name;

  String normalizedName;

  String businessDescription;

  String businessPhrase;

  String businessLogo;

  String contactName;

  String address;

  String zone;

  int cityId;

  Cities city;

  double latitude;

  double longitude;

  String phoneNumber;

  String email;

  int siteTypeId;
  // range from 1 to 200//

  SiteType siteType;

  int subSiteTypeId;
  // range from 1 to 200//

  bool useGPS;

  bool haveHomeDelivery;

  String facebookUrl;

  String twitterUrl;

  String instagramUrl;

  String webSiteUrl;

  String schedule;

  bool isApproved;

  String confirmEmail;

  bool isVerifiedSite;

  String ciiU1;

  String ciiU2;

  String ciiU3;

  String ciiU4;

  String fullAddress;

  DateTime createdOn;

  DateTime updatedOn;

  int id;

  Site(
      {required this.businessId,
      required this.name,
      required this.normalizedName,
      required this.businessDescription,
      required this.businessPhrase,
      required this.businessLogo,
      required this.contactName,
      required this.address,
      required this.zone,
      required this.cityId,
      required this.city,
      required this.latitude,
      required this.longitude,
      required this.phoneNumber,
      required this.email,
      required this.siteTypeId,
      required this.siteType,
      required this.subSiteTypeId,
      required this.useGPS,
      required this.haveHomeDelivery,
      required this.facebookUrl,
      required this.twitterUrl,
      required this.instagramUrl,
      required this.webSiteUrl,
      required this.schedule,
      required this.isApproved,
      required this.confirmEmail,
      required this.isVerifiedSite,
      required this.ciiU1,
      required this.ciiU2,
      required this.ciiU3,
      required this.ciiU4,
      required this.fullAddress,
      required this.createdOn,
      required this.updatedOn,
      required this.id});

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
        businessId: json['businessId'] ?? '',
        name: json['name'] ?? '',
        normalizedName: json['normalizedName'] ?? '',
        businessDescription: json['businessDescription'] ?? '',
        businessPhrase: json['businessPhrase'] ?? '',
        businessLogo: json['businessLogo'] ?? '',
        contactName: json['contactName'] ?? '',
        address: json['address'] ?? '',
        zone: json['zone'] ?? '',
        cityId: json['cityId'] ?? '',
        city: Cities.fromJson(json['city']),
        latitude: double.parse(json['latitude']?.toString() ?? '0'),
        longitude: double.parse(json['longitude']?.toString() ?? '0'),
        phoneNumber: json['phoneNumber'] ?? '',
        email: json['email'] ?? '',
        siteTypeId: json['siteTypeId'] ?? 0,
        siteType: SiteType.fromJson(json['siteType']),
        subSiteTypeId: json['subSiteTypeId'] ?? 0,
        useGPS: json['useGPS'] ?? false,
        haveHomeDelivery: json['haveHomeDelivery'] ?? false,
        facebookUrl: json['facebookUrl'] ?? "",
        twitterUrl: json['twitterUrl'] ?? "",
        instagramUrl: json['instagramUrl'] ?? "",
        webSiteUrl: json['webSiteUrl'] ?? "",
        schedule: json['schedule'] ?? "",
        isApproved: json['isApproved'] ?? false,
        confirmEmail: json['confirmEmail'] ?? "",
        isVerifiedSite: json['isVerifiedSite'] ?? false,
        ciiU1: json['ciiU1'] ?? "",
        ciiU2: json['ciiU2'] ?? "",
        ciiU3: json['ciiU3'] ?? "",
        ciiU4: json['ciiU4'] ?? "",
        fullAddress: json['fullAddress'] ?? "",
        createdOn: json['createdOn'] == null
            ? DateTime.now()
            : DateTime.parse(json['createdOn']),
        updatedOn: json['updatedOn'] == null
            ? DateTime.now()
            : DateTime.parse(json['updatedOn']),
        id: json['id'] ?? 0);
  }
}
