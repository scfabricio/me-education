import 'package:app/domain/vos/value_object.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class Email extends ValueObject {
  final String _value;

  Email(this._value);

  @override
  String? validator() {
    if (!string_validator.isEmail(_value)) {
      return 'Informe um email válido';
    }
    return null;
  }

  @override
  String toString() {
    return _value;
  }
}