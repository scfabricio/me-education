
import { User } from "../entities/User";
import dbconnection from "../../../config/dbconnection";
import { IncorrectUsernameOrPassword } from "../errors/AuthenticationError";
import { Either, left, rigth } from "../../../utils/Either";

export class AuthenticationDatasourse {
  async call(
    username: string, 
    password: string,
  ): Promise<Either<IncorrectUsernameOrPassword, User>> {
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
