
extension MapExt on Map<String, dynamic> {

  void removeNullOrEmptyValues() {
    removeWhere((key, value) => (value ?? '') == '');
  }

}