class ShippingAddressEntity {
  String? name;
  String? address1;
  String? address2;
  String? city;
  String? email;
  String? phone;

  ShippingAddressEntity({
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
}
