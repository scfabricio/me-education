import crypto from 'crypto';
import config from '../environment';

const { secret_key, secret_iv } = config;
const ecnryption_method = 'aes-256-cbc';

if (!secret_key || !secret_iv) {
  throw new Error('secretKey, secretIV, and ecnryptionMethod are required');
}

// Generate secret hash with crypto to use for encryption
const key = crypto
  .createHash('sha512')
  .update(secret_key)
  .digest('hex')
  .substring(0, 32);
const encryptionIV = crypto
  .createHash('sha512')
  .update(secret_iv)
  .digest('hex')
  .substring(0, 16);

export default class Encryption {
  static encryptData(data: string) {
    const cipher = crypto.createCipheriv(ecnryption_method, key, encryptionIV);
    return Buffer.from(
      cipher.update(data, 'utf8', 'hex') + cipher.final('hex')
    ).toString('base64'); // Encrypts data and converts to hex and base64
  }

  static decryptData(encryptedData: string) {
    const buff = Buffer.from(encryptedData, 'base64');
    const decipher = crypto.createDecipheriv(ecnryption_method, key, encryptionIV);
    return (
      decipher.update(buff.toString('utf8'), 'hex', 'utf8') +
      decipher.final('utf8')
    ); // Decrypts data and converts to utf8
  }
}
