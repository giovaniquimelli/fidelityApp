  /// Returns a masked [username] String based on the [personType]
  /// 
  /// return a CPF masked String if personType is 'F'
  /// or a CNPJ masked String otherwise,
  ///
  ///     maskUsername('00000000011', 'F');    // '000.000.000-11'
  ///     maskUsername('00000000000014', 'J'); // '00.000.000/0000-14'
String maskUsername(String username, String personType) {
  String _personType = personType ?? 'F';
  String _username = username ?? 'CPF/CNPJ';

  if (_personType == 'F') {
    try {
      _username = _username.substring(0, 3) +
          '.' +
          _username.substring(3, 6) +
          '.' +
          _username.substring(6, 9) +
          '-' +
          _username.substring(9);
      return _username;
    } catch (e) {
      return '000.000.000-00';
    }
  }
  try {
    _username = _username.substring(0, 2) +
        '.' +
        _username.substring(2, 5) +
        '.' +
        _username.substring(5, 8) +
        '/' +
        _username.substring(8, 12) +
        '-' +
        _username.substring(12);
    return _username;
  } catch (e) {
    return '00.000.000/0000-00';
  }
}
