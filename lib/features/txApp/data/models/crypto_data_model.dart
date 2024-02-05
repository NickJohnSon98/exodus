class CryptoDataModel {
  final String id;
  final String symbol;
  final String name;
  final String icon;
  final double currentPrice;
  final double high24h;
  final double low24h;
  final DateTime lastUpdate;
  final List<double> lastWeekPriceChanges;
  CryptoDataModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.icon,
    required this.currentPrice,
    required this.high24h,
    required this.low24h,
    required this.lastUpdate,
    required this.lastWeekPriceChanges,
  });

  CryptoDataModel copyWith({
    String? id,
    String? symbol,
    String? name,
    String? icon,
    double? currentPrice,
    double? high24h,
    double? low24h,
    DateTime? lastUpdate,
    List<double>? lastWeekPriceChanges,
  }) {
    return CryptoDataModel(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      currentPrice: currentPrice ?? this.currentPrice,
      high24h: high24h ?? this.high24h,
      low24h: low24h ?? this.low24h,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastWeekPriceChanges: lastWeekPriceChanges ?? this.lastWeekPriceChanges,
    );
  }

  factory CryptoDataModel.fromMap(Map<String, dynamic> map) {
    return CryptoDataModel(
      id: map['id'] as String,
      symbol: (map['symbol'] as String).toUpperCase(),
      name: map['name'] as String,
      icon: map['image'] as String,
      currentPrice: (map['current_price'] /1),
      high24h:( map['high_24h'] /1),
      low24h:( map['low_24h'] /1),
      lastUpdate: DateTime.parse(map["last_updated"]),
      lastWeekPriceChanges: List<double>.from(((map["sparkline_in_7d"]??{})["price"] ?? []),
    ));
  }
}