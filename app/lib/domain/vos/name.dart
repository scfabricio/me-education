import 'package:app/domain/vos/value_object.dart';

class Name extends ValueObject {
  final String _value;
  
  Name(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Informe o nome';
    }

    if (_value.split(' ').length < 2) {
      return 'Informe o nome com sobrenome';
    }
 
    return null;
  }

  @override
  String toString() {
    return _value;
  }
}