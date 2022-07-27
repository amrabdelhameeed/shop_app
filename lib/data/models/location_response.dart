class LocationResponse {
  LocationResponse({
    required this.summary,
    required this.addresses,
  });
  late final Summary summary;
  late final List<Addresses> addresses;

  LocationResponse.fromJson(Map<String, dynamic> json) {
    summary = Summary.fromJson(json['summary']);
    addresses =
        List.from(json['addresses']).map((e) => Addresses.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['summary'] = summary.toJson();
    data['addresses'] = addresses.map((e) => e.toJson()).toList();
    return data;
  }
}

class Summary {
  Summary({
    required this.queryTime,
    required this.numResults,
  });
  late final int queryTime;
  late final int numResults;

  Summary.fromJson(Map<String, dynamic> json) {
    queryTime = json['queryTime'];
    numResults = json['numResults'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['queryTime'] = queryTime;
    data['numResults'] = numResults;
    return data;
  }
}

class Addresses {
  Addresses({
    required this.address,
    required this.position,
  });
  late final Address address;
  late final String position;

  Addresses.fromJson(Map<String, dynamic> json) {
    address = Address.fromJson(json['address']);
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address.toJson();
    data['position'] = position;
    return data;
  }
}

class Address {
  Address({
    required this.routeNumbers,
    required this.street,
    required this.streetName,
    required this.countryCode,
    required this.countrySubdivision,
    required this.municipality,
    required this.municipalitySubdivision,
    required this.country,
    required this.countryCodeISO3,
    required this.freeformAddress,
    required this.boundingBox,
    required this.localName,
  });
  late final List<dynamic> routeNumbers;
  late final String street;
  late final String streetName;
  late final String countryCode;
  late final String countrySubdivision;
  late final String municipality;
  late final String municipalitySubdivision;
  late final String country;
  late final String countryCodeISO3;
  late final String freeformAddress;
  late final BoundingBox boundingBox;
  late final String localName;

  Address.fromJson(Map<String, dynamic> json) {
    routeNumbers = List.castFrom<dynamic, dynamic>(json['routeNumbers']);
    street = json['street'];
    streetName = json['streetName'];
    countryCode = json['countryCode'];
    countrySubdivision = json['countrySubdivision'];
    municipality = json['municipality'];
    municipalitySubdivision = json['municipalitySubdivision'];
    country = json['country'];
    countryCodeISO3 = json['countryCodeISO3'];
    freeformAddress = json['freeformAddress'];
    boundingBox = BoundingBox.fromJson(json['boundingBox']);
    localName = json['localName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['routeNumbers'] = routeNumbers;
    data['street'] = street;
    data['streetName'] = streetName;
    data['countryCode'] = countryCode;
    data['countrySubdivision'] = countrySubdivision;
    data['municipality'] = municipality;
    data['municipalitySubdivision'] = municipalitySubdivision;
    data['country'] = country;
    data['countryCodeISO3'] = countryCodeISO3;
    data['freeformAddress'] = freeformAddress;
    data['boundingBox'] = boundingBox.toJson();
    data['localName'] = localName;
    return data;
  }
}

class BoundingBox {
  BoundingBox({
    required this.northEast,
    required this.southWest,
    required this.entity,
  });
  late final String northEast;
  late final String southWest;
  late final String entity;

  BoundingBox.fromJson(Map<String, dynamic> json) {
    northEast = json['northEast'];
    southWest = json['southWest'];
    entity = json['entity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['northEast'] = northEast;
    data['southWest'] = southWest;
    data['entity'] = entity;
    return data;
  }
}
