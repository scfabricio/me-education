import { UserRepository } from "../repositories/UserRepository";

export default class loginByEmailAndPass {
  private _repository: UserRepository;
  
  constructor(repository: UserRepository) {
    this._repository = repository;
  }

  call(username: string, password: string) {
    return this._repository.login(username, password);
  }
}
