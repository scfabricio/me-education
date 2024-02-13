import express from 'express';
import cors from 'cors';
import ConfigRoutes from './routes';
import environment from './environment';

const app = express();
app.use(express.json());
app.use(cors({ origin: '*' }));

ConfigRoutes(app);

app.get('/', (req, res) => {
    return res.send('Tudo ok');
});

app.listen(environment.port, () => {
    console.log(`Servidor rodando na porta ${environment.port}`);
});
