class Singnup {
  final String name;
  final String gmail;
  final String phoneNumber;
  final String company;
  final String address;
  final String gst;

  Singnup(
      {required this.name,
      required this.gmail,
      required this.phoneNumber,
      required this.company,
      required this.address,
      required this.gst});

  toJson() {
    return {
      "name": name,
      "gmail": gmail,
      "phoneNumber": phoneNumber,
      "company": company,
      "address": address,
      "gst": gst
    };
  }
}
