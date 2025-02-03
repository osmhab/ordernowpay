import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _tablesCount =
          await secureStorage.getInt('ff_tablesCount') ?? _tablesCount;
    });
    await _safeInitAsync(() async {
      _itemsCount = await secureStorage.getInt('ff_itemsCount') ?? _itemsCount;
    });
    await _safeInitAsync(() async {
      _ShowApplePayAd =
          await secureStorage.getBool('ff_ShowApplePayAd') ?? _ShowApplePayAd;
    });
    await _safeInitAsync(() async {
      _showTutorial =
          await secureStorage.getBool('ff_showTutorial') ?? _showTutorial;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _tipsContainerShow = true;
  bool get tipsContainerShow => _tipsContainerShow;
  set tipsContainerShow(bool value) {
    _tipsContainerShow = value;
  }

  int _tablesCount = 0;
  int get tablesCount => _tablesCount;
  set tablesCount(int value) {
    _tablesCount = value;
    secureStorage.setInt('ff_tablesCount', value);
  }

  void deleteTablesCount() {
    secureStorage.delete(key: 'ff_tablesCount');
  }

  int _itemsCount = 0;
  int get itemsCount => _itemsCount;
  set itemsCount(int value) {
    _itemsCount = value;
    secureStorage.setInt('ff_itemsCount', value);
  }

  void deleteItemsCount() {
    secureStorage.delete(key: 'ff_itemsCount');
  }

  bool _ShowApplePayAd = true;
  bool get ShowApplePayAd => _ShowApplePayAd;
  set ShowApplePayAd(bool value) {
    _ShowApplePayAd = value;
    secureStorage.setBool('ff_ShowApplePayAd', value);
  }

  void deleteShowApplePayAd() {
    secureStorage.delete(key: 'ff_ShowApplePayAd');
  }

  bool _showTutorial = true;
  bool get showTutorial => _showTutorial;
  set showTutorial(bool value) {
    _showTutorial = value;
    secureStorage.setBool('ff_showTutorial', value);
  }

  void deleteShowTutorial() {
    secureStorage.delete(key: 'ff_showTutorial');
  }

  String _imageToShow = '';
  String get imageToShow => _imageToShow;
  set imageToShow(String value) {
    _imageToShow = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
