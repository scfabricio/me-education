export class IncorrectUsernameOrPassword extends Error {
  private _message: string;
  private _statusCode: number;


  constructor(message = "Usuário ou senha incorretos", statusCode = 401) {
    super(message);
    this._message = message;
    this._statusCode = statusCode;
  }

  get message() {
    return this._message;
  }
  
  get statusCode() {
    return this._statusCode;
  }
}
