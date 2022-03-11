/// Returns a masked [username] String based on the [personType]
///
/// return a CPF masked String if personType is 'F'
/// or a CNPJ masked String otherwise,
///
///     maskUsername('00000000011', 'F');    // '000.000.000-11'
///     maskUsername('00000000000014', 'J'); // '00.000.000/0000-14'
String setDecimalPrecision(String input, {int precision = 2}) {
  try {
    return input.substring(0, input.indexOf('.') + precision + 1);
  } catch (e) {
    return '0.00';
  }
}
