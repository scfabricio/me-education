import { Express } from 'express';

import AuthenticationRoutes from './AuthenticationRoutes';

function ConfigRoutes(app: Express) {
    app.use('/authentication', AuthenticationRoutes);
}

export default ConfigRoutes;