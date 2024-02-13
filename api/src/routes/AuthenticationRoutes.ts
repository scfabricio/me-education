import express from 'express';
import { AuthenticationCountroller } from '../api/authentication/controllers/AuthenticationController';

const AuthenticationRoutes = express.Router();

AuthenticationRoutes.post('/register', AuthenticationCountroller.registerWithEmailAndPass);
AuthenticationRoutes.post('/', AuthenticationCountroller.authenticationByEmailAndPass);

export default AuthenticationRoutes;
