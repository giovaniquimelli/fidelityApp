/// Returns a [month] String based on the [startDatetime]
///
/// returns a String based on the month of the DateTime Provided
///
///     parsedMonth('2020-12-30 17:49:48'); // 'DEZ'
///     parsedMonth('2021-01-19 17:49:48'); // 'JAN'
String parsedMonth(DateTime startDatetime) {
  int _monthInt = 1;
  _monthInt = startDatetime.month;
  int _monthIndex = _monthInt - 1;

  String _month = '';
  List<String> _monthStringList = [
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ'
  ];
  try {
    _month = _monthStringList[_monthIndex];
  } catch (e) {
    _month = 'Mês';
    print(e);
  }

  return _month;
}
