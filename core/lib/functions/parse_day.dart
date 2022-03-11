/// Returns a [day] String based on the [startDatetime]
///
/// returns a double digit String based on the day of the DateTime Provided
///
///     parsedMonth('2020-12-30 17:49:48'); // '30'
///     parsedMonth('2021-01-01 17:49:48'); // '01'
String parsedDay(DateTime startDatetime) {
  int _dayInt = startDatetime?.day ?? 1;

  String _parsedDay;

  switch (_dayInt) {
    case 1:
      _parsedDay = '01';
      break;
    case 2:
      _parsedDay = '02';
      break;
    case 3:
      _parsedDay = '03';
      break;
    case 4:
      _parsedDay = '04';
      break;
    case 5:
      _parsedDay = '05';
      break;
    case 6:
      _parsedDay = '06';
      break;
    case 7:
      _parsedDay = '07';
      break;
    case 8:
      _parsedDay = '08';
      break;
    case 9:
      _parsedDay = '09';
      break;
    default:
      _parsedDay = _dayInt.toString();
  }

  return _parsedDay;
}
