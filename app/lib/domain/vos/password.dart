import 'package:app/domain/vos/value_object.dart';

class Password extends ValueObject {
  final String _value;
  
  Password(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Informe uma senha';
    }

    if (_value.length < 8 || _value.length > 12) {
      return 'A senha precisa ter entre 8 e 12 caracteres';
    }
 
    return null;
  }

  @override
  String toString() {
    return _value;
  }
}