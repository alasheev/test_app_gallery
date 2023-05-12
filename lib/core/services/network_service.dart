import 'package:internet_connection_checker/internet_connection_checker.dart';


abstract class NetworkService {
  Future<bool> get isConnected;
}

class NetworkServiceImpl implements NetworkService {
  const NetworkServiceImpl(this.connectionChecker);

  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
