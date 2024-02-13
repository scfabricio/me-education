export class User {
  private _id?: number;
  private _name: string;
  private _email: string;
  private _password: string;

  constructor(
    id: number | undefined,
    name: string,
    email: string,
    password: string
  ) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._password = password;
  }

  get id() {
    return this._id;
  }
  
  get name() {
    return this._name;
  }

  get email() {
    return this._email;
  }

  get password() {
    return this._password;
  }

  static fromJson(json: any): User {
    return new User(
      json["id"],
      json["name"],
      json["email"],
      json["password"]
    );
  }

  static toJson(user: User): any {
    return {
      id: user._id,
      name: user._name,
      email: user._email,
      password: user._password
    };
  }

  copyWith({
    id,
    name, 
    email,
    password
  }: {
    id?: number,
    name?: string,
    email?: string,
    password?: string
  }): User {
    return new User(
      id ?? this._id,
      name ?? this._name,
      email ?? this._email,
      password ?? this._password
    );
  }
}
