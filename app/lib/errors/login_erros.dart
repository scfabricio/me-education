class LoginFailure implements Exception {}

class InvalidFormLoginFailure extends LoginFailure {}

class UnauthorizedLoginFailure extends LoginFailure {}

class GenericLoginFailure extends LoginFailure {}

class EmailRegisteredFailure extends LoginFailure {}