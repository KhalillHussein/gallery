class Transaction {
  final String? transID;
  final String? object;
  final String? objectName;
  final String? date;
  final String? clientName;
  final String? cardNumber;
  final String? cardHolder;
  final String? brand;
  final String? addressLink;
  final String? address;
  final String? fuelType;
  final double? amountWialon;
  final double? currValue;
  final double? currSumm;
  final double? fuelLat;
  final double? fuelLon;
  final double? wialLat;
  final double? wialLon;
  final double? diff;
  final int? wialTransID;
  final bool? isMoneyBack;
  final double? unitTrankVol;
  final Fills? pprFills;
  final Fills? wialFills;
  final Fills? pprFillsMB;
  final CurrencyInfo? currencyInfo;
  final int? num;

  const Transaction({
    this.transID,
    this.object,
    this.objectName,
    this.date,
    this.clientName,
    this.cardNumber,
    this.cardHolder,
    this.brand,
    this.addressLink,
    this.address,
    this.fuelType,
    this.amountWialon,
    this.currValue,
    this.currSumm,
    this.fuelLat,
    this.fuelLon,
    this.wialLat,
    this.wialLon,
    this.diff,
    this.wialTransID,
    this.isMoneyBack,
    this.unitTrankVol,
    this.pprFills,
    this.pprFillsMB,
    this.currencyInfo,
    this.num,
    this.wialFills,
  });

  Map<String, dynamic> toMap() {
    return {
      'transID': transID,
      'object': object,
      'objectName': objectName,
      'date': date,
      'clientName': clientName,
      'cardNumber': cardNumber,
      'cardHolder': cardHolder,
      'brand': brand,
      'addressLink': addressLink,
      'address': address,
      'fuelType': fuelType,
      'amountWialon': amountWialon,
      'currValue': currValue,
      'currSumm': currSumm,
      'fuelLat': fuelLat,
      'fuelLon': fuelLon,
      'wialLat': wialLat,
      'wialLon': wialLon,
      'diff': diff,
      'wialTransID': wialTransID,
      'isMoneyBack': isMoneyBack,
      'unitTrankVol': unitTrankVol,
      'pprFills': pprFills?.toMap(),
      'wialFills': wialFills?.toMap(),
      'pprFillsMB': pprFillsMB?.toMap(),
      'currencyInfo': currencyInfo?.toMap(),
      'num': num,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> map) {
    return Transaction(
      transID: map['transID'],
      object: '${map['object']}',
      objectName: map['objectName'],
      date: map['date'],
      clientName: map['clientName'],
      cardNumber: map['cardNumber'],
      cardHolder: map['cardHolder'],
      brand: map['brand'],
      addressLink: map['addressLink'],
      address: map['address'],
      fuelType: map['fuelType'],
      amountWialon: map['amountWialon'],
      currValue: map['currValue'] as double,
      currSumm: map['currSumm'] as double,
      fuelLat: map['fuelLat'] as double,
      fuelLon: map['fuelLon'] as double,
      wialLat: map['wialLat'] as double,
      wialLon: map['wialLon'] as double,
      diff: map['diff'] ?? 0.0,
      wialTransID: map['wialTransID'],
      isMoneyBack: map['isMoneyBack'],
      unitTrankVol: map['unitTrankVol'].toDouble(),
      pprFills: Fills.fromJson(map['pprFills']),
      wialFills: Fills.fromJson(map['wialFills']),
      pprFillsMB: Fills.fromJson(map['pprFillsMB']),
      currencyInfo: CurrencyInfo.fromJson(map['currencyInfo']),
      num: map['num'],
    );
  }
}

class Fills {
  final String? transID;
  final String? date;
  final double? summ;
  final double? value;

  const Fills({
    this.transID,
    this.date,
    this.summ,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'transID': transID,
      'date': date,
      'summ': summ,
      'value': value,
    };
  }

  factory Fills.fromJson(Map<String, dynamic> map) {
    return Fills(
      transID: '${map['transID']}',
      date: map['date'],
      summ: double.tryParse('${map['summ']}') ?? 0.0,
      value: double.tryParse('${map['value']}') ?? 0.0,
    );
  }
}

class CurrencyInfo {
  final String? symbol;
  final int? isRight;
  final String? name;
  final double? isoDig;
  final double? isoLat;

  const CurrencyInfo({
    this.symbol,
    this.isRight,
    this.name,
    this.isoDig,
    this.isoLat,
  });

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'isRight': isRight,
      'name': name,
      'isoDig': isoDig,
      'isoLat': isoLat,
    };
  }

  factory CurrencyInfo.fromJson(Map<String, dynamic> map) {
    return CurrencyInfo(
      symbol: map['symbol'],
      isRight: map['is_right'],
      name: map['name'],
      isoDig: map['ISO_DIG'].isEmpty ? 0.0 : double.tryParse(map['ISO_DIG']),
      isoLat: map['ISO_LAT'].isEmpty ? 0.0 : double.tryParse(map['ISO_LAT']),
    );
  }
}
