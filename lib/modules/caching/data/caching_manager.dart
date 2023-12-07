const _cacheInterval = 60 * 1000;

class CacheKeys {
  CacheKeys._();

  static const userinfo = "userinfo";
}

class CacheManager {
  /// singleton
  CacheManager._internal();
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;

  Map<String, CacheItem> cacheMap = {};

  void setData(String key, String data) {
    cacheMap[key] = CacheItem(data);
  }

  String getData(String key) {
    CacheItem? cacheItem = cacheMap[key];
    if (cacheItem != null && cacheItem.isValid()) {
      return cacheItem.data;
    } else {
      throw Exception("no data cached");
    }
  }

  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  void clearCache() {
    cacheMap.clear();
  }
}

class CacheItem {
  String data;
  late int cacheTime;
  CacheItem(this.data) {
    cacheTime = DateTime.now().millisecondsSinceEpoch;
  }
}

extension CacheItemExtension on CacheItem {
  bool isValid() {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTime - cacheTime < _cacheInterval;
    return isValid;
  }
}
