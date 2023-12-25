import { User } from "../entities/User";
import { UserRepository } from "../repositories/UserRepository";

export default class RegisterWithEmailAndPass {
  private _repository: UserRepository;

  constructor(repository: UserRepository) {
    this._repository = repository;
  }

  call(user: User) {
    return this._repository.save(user);
  }
}
