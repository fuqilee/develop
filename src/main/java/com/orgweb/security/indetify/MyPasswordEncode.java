package com.orgweb.security.indetify;


import static org.springframework.security.crypto.util.EncodingUtils.concatenate;

import org.springframework.security.crypto.codec.Hex;
import org.springframework.security.crypto.codec.Utf8;
import org.springframework.security.crypto.keygen.BytesKeyGenerator;
import org.springframework.security.crypto.keygen.KeyGenerators;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.orgweb.utils.EncryptionUtil;

public final class MyPasswordEncode implements PasswordEncoder {


	private final byte[] secret;

	private final BytesKeyGenerator saltGenerator;

	/**
	 * Constructs a standard password encoder with no additional secret value.
	 */
	public MyPasswordEncode() {
		this("");
	}


	/**
	 * Constructs a standard password encoder with a secret value which is also included
	 * in the password hash.
	 *
	 * @param secret the secret key used in the encoding process (should not be shared)
	 */
	public MyPasswordEncode(CharSequence secret) {
		this("SHA-256", secret);
	}

	public String encode(CharSequence rawPassword) {
		return EncryptionUtil.encryptionByMD5(rawPassword.toString());
	}

	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		return encodedPassword.equals(encode(rawPassword));
	}

	// internal helpers

	private MyPasswordEncode(String algorithm, CharSequence secret) {
		//this.digester = new Digester(algorithm, DEFAULT_ITERATIONS);
		this.secret = Utf8.encode(secret);
		this.saltGenerator = KeyGenerators.secureRandom();
	}

	private String encode(CharSequence rawPassword, byte[] salt) {
		return EncryptionUtil.encryptionByMD5(rawPassword.toString());
	}

	private byte[] digest(CharSequence rawPassword, byte[] salt) {
		byte[] digest = null;
		return concatenate(salt, digest);
	}

	private byte[] decode(CharSequence encodedPassword) {
		return Hex.decode(encodedPassword);
	}

	/**
	 * Constant time comparison to prevent against timing attacks.
	 */
	private boolean matches(byte[] expected, byte[] actual) {
		if (expected.length != actual.length) {
			return false;
		}

		int result = 0;
		for (int i = 0; i < expected.length; i++) {
			result |= expected[i] ^ actual[i];
		}
		return result == 0;
	}

	private static final int DEFAULT_ITERATIONS = 1024;


}
