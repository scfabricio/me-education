import { Request, Response } from 'express';
import { UserDatasourceImpl } from '../datasource/UserDatasourse';
import { UserRepositoryImpl } from '../repositories/UserRepository';
import LoginByEmailAndPass from '../usecases/LoginByEmailAndPass';
import RegisterWithEmailAndPass from '../usecases/RegisterWithEmailAndPass';
import Encryption from '../../../utils/Encryption';
import { User } from '../entities/User';

export class AuthenticationCountroller {
  static async authenticationByEmailAndPass(req: Request, res: Response) {
    try {
      const { username, password } = req.body;

      const datasource = new UserDatasourceImpl();
      const repositorie = new UserRepositoryImpl(datasource);
      const usecase = new LoginByEmailAndPass(repositorie);

      const userEither = await usecase.call(username, Encryption.encryptData(password));

      if (userEither.isLeft()) {
        return res
          .status(userEither.value.statusCode)
          .json({ message: userEither.value.message });
      }

      // Gerar um access_token
      // Gerar um refresh_token
      // {
      //   accessToken: '',
      //   refreshToken: '',
      //   expiresIn: 3600
      // }

      return res.status(200).json({
        accessToken: '',
        refreshToken: '',
        expiresIn: '',
        id: 1,
        email: 'usuario@email.com.br',
        name: 'Usuário Admin'
      });
    } catch (err) {
      return res.status(500).json({ message: 'Erro desconhecido' });
    }
  }

  static async registerWithEmailAndPass(req: Request, res: Response) {
    try {
      const {
        name,
        email,
        password,
        confirmePassword,
      } = req.body;

      if (password !== confirmePassword) return res.status(400).json({ message: 'Senhas não coincidem' });

      const user = new User(
        undefined,
        name,
        email,
        Encryption.encryptData(password),
      );

      const datasource = new UserDatasourceImpl();
      const repositorie = new UserRepositoryImpl(datasource);
      const usecase = new RegisterWithEmailAndPass(repositorie);

      const userEither = await usecase.call(user);

      if (userEither.isLeft()) {
        return res
          //.status(userEither.value.statusCode)
          .json({ message: userEither.value.message });
      }

      return res.status(200).json({
        id: userEither.value.id,
        name: userEither.value.name,
        email: userEither.value.email
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: 'Erro desconhecido' });
    }
  }
}
