class SystemStatusController {
  SystemStatusController._privateConstructor();

  static final SystemStatusController instance =
      SystemStatusController._privateConstructor();

  final List<String> _status = [];

  void add(String status) {
    if (!_status.contains(status)) {
      _status.clear();
      _status.add(status);
    }
  }

  List<String> status() => _status;
}
