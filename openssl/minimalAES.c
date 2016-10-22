#include <openssl/evp.h>

int main()
{
    EVP_CIPHER_CTX *ctx;
    unsigned char key[32] = {0};
    unsigned char iv[16] = {0};
    unsigned char in[16] = {0};
    unsigned char out[32]; /* at least one block longer than in[] */
    int outlen1, outlen2;

    EVP_CIPHER cipher = aes_256_cbc_spl();
   ctx->cipher=cipher;
   ctx->cipher->init(ctx,key,iv,enc);
    EVP_EncryptInit(ctx, cipher, key, iv);
   EVP_EncryptUpdate(ctx, out, &outlen1, in, sizeof(in));
  EVP_EncryptFinal(ctx, out + outlen1, &outlen2);

  printf("ciphertext length: %d\n", outlen1 + outlen2);
    int sink = outlen1;
    return 0;
}
