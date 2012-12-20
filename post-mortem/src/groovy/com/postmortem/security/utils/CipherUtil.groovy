package com.postmortem.security.utils

import java.text.SimpleDateFormat

import javax.crypto.Cipher
import javax.crypto.SecretKey
import javax.crypto.spec.SecretKeySpec

import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/**
 * Classe responsavel por encriptar e decriptar utilizando BASE64,
 * ira decriptar o valor do cookie cliID criado no carrinho.
 * @author luiz.rodrigues
 * @since 04/12/2007
 */
class CipherUtil implements Serializable {
	

	private static final long serialVersionUID = 1L

	private static final Log logger = LogFactory.getLog(CipherUtil.class.getSimpleName())
	
	private static final String algorithm = "Blowfish"
	
	private static final String algorithmTransformation = "Blowfish/ECB/PKCS5Padding"

	private SecretKey desKey = null

	private byte[] key = new byte[8]

	private Date dataAtual = new Date()

	private byte[] yearKey = getData(dataAtual, "yy").getBytes()

	private byte[] dayKey = getData(dataAtual, "dd").getBytes()

	private byte[] monthKey = getData(dataAtual, "MM").getBytes()
	
	/**
	 * Construtor.
	 */
	public CipherUtil() {
		this.setKey()
	}

	/**
	 * Metodo responsável por gerar chave.
	 * @return desKey
	 */
	private getKeyGen() {
		desKey = new SecretKeySpec(dayKey, algorithm)
		return desKey
	}

	/**
	 * Metodo responsável por setar valor da chave utilizado
	 * para encriptar e decriptar.
	 */
	private void setKey() {
		try {
			// Iniciando o cipher
			def enCipher = Cipher.getInstance(algorithmTransformation)
				enCipher.init(Cipher.WRAP_MODE, this.getKeyGen())
			key = enCipher.wrap(this.getKeyGen()) // Guardando a chave
		} catch (e) {
			logger.error("Ocorreu o seguinte erro na tentativa de setar o valor de key", e)
		}
	}

	/**
	 * Encripta os dados.
	 * @param data
	 * @return result
	 */
	String encrypt(String cleanText) {
		String encodedEncryptData
		try {
			// Criando o Cipher
			def enCipher = Cipher.getInstance(algorithmTransformation)
				// Iniciando o cipher
				enCipher.init(Cipher.WRAP_MODE, this.getKeyGen())
				enCipher.init(Cipher.ENCRYPT_MODE, this.getKeyGen())

			// O dado já criptografado
			encodedEncryptData = new sun.misc.BASE64Encoder().encode( enCipher.doFinal(cleanText.getBytes()) )
		} catch (e) {
			logger.error("Ocorreu o seguinte erro na tentativa de encriptar", e)
		}

		encodedEncryptData
	}

	/**
	 * Decripta os dados.
	 * @param dadoEncriptado
	 * @return String
	 */
	String decrypt(String digested) {
		String decryptedData
		try {
			// Criando o Cipher
			def desCipher = Cipher.getInstance(algorithmTransformation)

			// Inicializando o cipher e pegando a minha chave para descriptografar
			desCipher.init(Cipher.UNWRAP_MODE, this.getKeyGen())
			desCipher.init(Cipher.DECRYPT_MODE, desCipher.unwrap(key, "Blowfish", Cipher.SECRET_KEY))

			// Descriptografando
			decryptedData = new String(desCipher.doFinal( new sun.misc.BASE64Decoder().decodeBuffer(digested) ))
		} catch (e) {
			logger.error("Ocorreu o seguinte erro na tentativa de decriptar", e)
		}
		
		decryptedData
	}
    
    
    /**
      * Retorna a data de entrega no padrão especificado. 
      * @param dataEntrega
      * @param pattern - padrão de data desejada.
      * @return String - data formatada.
      */
     static String getData(Date data,String pattern)  {
		 def sdf = new SimpleDateFormat()
		 	 sdf.applyPattern(pattern)
			 
		sdf.format(data)
     }
}
