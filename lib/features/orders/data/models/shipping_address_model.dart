class ShippingAddressModel {
  String? name;
  String? address1;
  String? address2;
  String? city;
  String? email;
  String? phone;

  ShippingAddressModel({
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.email,
    this.phone,
  });

  @override
  String toString() {
    return '$address1, $address2, $city';
  }

  toJson() {
    return {
      'name': name,
      'address1': address1,
      'address2': address2,
      'city': city,
      'email': email,
      'phone': phone,
    };
  }

  static ShippingAddressModel fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
