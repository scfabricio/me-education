import knex from "knex";
import config from "../../knexfile";
import environment from "../environment";

const connection = environment.env === 'prd'
    ? config.production
    : config.development;

export default knex(connection);