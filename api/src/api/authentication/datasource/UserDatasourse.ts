
import { User } from "../entities/User";
import dbconnection from "../../../config/dbconnection";
import { IncorrectUsernameOrPassword } from "../errors/AuthenticationError";
import { Either, left, rigth } from "../../../utils/Either";

export interface UserDatasource {
  save: (user: User) => Promise<Either<Error,User>>;
  login: (username: string, password: string) => Promise<Either<IncorrectUsernameOrPassword,User>>;
}

export class UserDatasourceImpl implements UserDatasource {
  async save(user: User): Promise<Either<Error, User>> {
    const res = await dbconnection.insert(User.toJson(user)).into('users');
    if (res.length <= 0) return left(new Error());
    return rigth(user.copyWith({ id: res[0] }));
  }
  
  async login(username: string, password: string): Promise<Either<IncorrectUsernameOrPassword, User>> {
    const query = await dbconnection.select()
      .from('users')
      .where({
        email: username,
        password
      });

    if (query.length <= 0) {
      return left(new IncorrectUsernameOrPassword());
    }

    return rigth(User.fromJson(query[0]));
  }
}
