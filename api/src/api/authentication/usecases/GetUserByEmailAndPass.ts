import { Either } from "../../../utils/Either";
import { User } from "../entities/User";
import { IncorrectUsernameOrPassword } from "../errors/AuthenticationError";
import { GetUserByEmailAndPassRepository } from '../repositories/GetUserByEmailAndPassRepository';

export class GetUserByEmailAndPass {
    private _repository: GetUserByEmailAndPassRepository;

    constructor(repository: GetUserByEmailAndPassRepository) {
      this._repository = repository;
    }

    call(username: string, password: string): Promise<Either<IncorrectUsernameOrPassword, User>> {
      return this._repository.call(username, password);
    }
}
