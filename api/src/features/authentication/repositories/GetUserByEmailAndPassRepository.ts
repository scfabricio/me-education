import { Either } from "../../../utils/Either";
import { AuthenticationDatasourse } from "../datasource/AuthenticationDatasourse";
import { User } from "../entities/User";
import { IncorrectUsernameOrPassword } from "../errors/AuthenticationError";

export class GetUserByEmailAndPassRepository {
  private _datasource: AuthenticationDatasourse;

  constructor(datasource: AuthenticationDatasourse) {
    this._datasource = datasource;
  }

  call(username: string, password: string): Promise<Either<IncorrectUsernameOrPassword, User>> {
    return this._datasource.call(username, password);
  }
}
