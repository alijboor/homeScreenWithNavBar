class AddressInfoEntity {
  String phoneNumber;
  String firstName;
  String lastName;
  String street;
  String postalCode;
  String country;
  String city;
  bool isDefault;

  AddressInfoEntity(
      {required this.phoneNumber,
      required this.country,
      required this.city,
      required this.firstName,
      required this.lastName,
      this.postalCode = '',
      this.street = '',
      this.isDefault = false});
}