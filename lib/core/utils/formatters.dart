import 'package:intl/intl.dart';

/// Formatting utilities for energy, currency, and dates
class Formatters {
  Formatters._();

  static final _currencyFormat = NumberFormat('#,##0', 'fr_FR');
  static final _kwhFormat = NumberFormat('#,##0.##', 'fr_FR');
  static final _percentFormat = NumberFormat('##0.#', 'fr_FR');
  static final _dateFormat = DateFormat('dd MMM yyyy', 'fr_FR');
  static final _dateTimeFormat = DateFormat('dd MMM yyyy HH:mm', 'fr_FR');
  static final _shortDateFormat = DateFormat('dd/MM', 'fr_FR');

  /// Format a value in FCFA: "12 500 FCFA"
  static String currency(double value) =>
      '${_currencyFormat.format(value)} FCFA';

  /// Format kWh: "45,3 kWh"
  static String kwh(double value) => '${_kwhFormat.format(value)} kWh';

  /// Format watts: "1 200 W"
  static String watts(double value) => '${_currencyFormat.format(value)} W';

  /// Format percentage: "18,5%"
  static String percent(double value) => '${_percentFormat.format(value)}%';

  /// Format date: "15 Jan 2025"
  static String date(DateTime dt) => _dateFormat.format(dt);

  /// Format date+time: "15 Jan 2025 14:30"
  static String dateTime(DateTime dt) => _dateTimeFormat.format(dt);

  /// Short date: "15/01"
  static String shortDate(DateTime dt) => _shortDateFormat.format(dt);

  /// Days remaining: "3 jours"
  static String daysRemaining(int days) {
    if (days <= 0) return "Aujourd'hui";
    if (days == 1) return '1 jour';
    return '$days jours';
  }
}
