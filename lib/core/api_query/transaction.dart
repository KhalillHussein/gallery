///Model class to storage transaction parameters for Api Query
class TransactionApiQuery {
  final int? clientId;
  final String? from;
  final String? to;
  final List<String>? card;
  final List<bool>? match;
  final bool? diffMore10;
  final bool? diff_5_10;
  final bool? diffLess5;

  TransactionApiQuery({
    this.clientId,
    this.from,
    this.to,
    this.card,
    this.match,
    this.diffMore10,
    this.diff_5_10,
    this.diffLess5,
  });

  Map<String, dynamic> toMap() {
    return {
      'client_id': clientId,
      'from': from,
      'to': to,
      'card': card,
      'match': match,
      'diff_more10': diffMore10,
      'diff_5_10': diff_5_10,
      'diff_less_5': diffLess5,
    }..removeWhere((key, value) => value == null);
  }

  factory TransactionApiQuery.fromJson(Map<String, dynamic> map) {
    return TransactionApiQuery(
      clientId: map['client_id'],
      from: map['from'],
      to: map['to'],
      card: List<String>.from(map['card']),
      match: List<bool>.from(map['match']),
      diffMore10: map['diff_more10'],
      diff_5_10: map['diff_5_10'],
      diffLess5: map['diff_less_5'],
    );
  }
}
