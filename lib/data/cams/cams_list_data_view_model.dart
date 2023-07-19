class CamsListDataViewModel {
  String? url;
  String? house;
  String? entry_number;
  bool? is_my_camera;
  CamsListDataViewModel(
      {this.url, this.house, this.entry_number, this.is_my_camera});
  CamsListDataViewModel.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    house = json["house"];
    entry_number = json["entry_number"];
    is_my_camera = json["is_my_camera"];
  }
}
