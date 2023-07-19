class AdvertisingDataViewModel {
  String? url;
  AdvertisingDataViewModel({this.url});
  AdvertisingDataViewModel.fromJson(Map<String, dynamic> json) {
    url = json["url"];
  }
}
