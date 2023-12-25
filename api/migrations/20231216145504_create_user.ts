import type { Knex } from "knex";
import Encryption from '../src/utils/Encryption';

export async function up(knex: Knex): Promise<void> {
    const pass = Encryption.encryptData('Teste@123');
    return knex.schema.createTable('users', (table) => {
        table.increments('id');
        table.string('name', 255).notNullable();
        table.string('email', 255).notNullable().unique();
        table.string('password', 255).notNullable();
    }).raw(
        `insert into users(name, email, password) values 
        ('admin', 'admin@email.com.br', '${pass}')`
    );
}


export async function down(knex: Knex): Promise<void> {
    return knex.schema.dropTable('users');
}

