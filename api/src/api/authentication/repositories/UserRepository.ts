import { Either } from "../../../utils/Either";
import { UserDatasource } from "../datasource/UserDatasourse";
import { User } from "../entities/User";
import { IncorrectUsernameOrPassword } from "../errors/AuthenticationError";

export interface UserRepository {
  save: (user: User) => Promise<Either<Error,User>>;
  login: (username: string, password: string) => Promise<Either<IncorrectUsernameOrPassword,User>>;
}

export class UserRepositoryImpl implements UserRepository {
  private _datasource: UserDatasource;

  constructor(datasource: UserDatasource) {
    this._datasource = datasource;
  }

  save(user: User) {
    return this._datasource.save(user);
  };

  login(username: string, password: string) {
    return this._datasource.login(username, password);
  };
}
