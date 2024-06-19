package com.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {

    public static String hash_string(String str) {
        String result = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(str.getBytes());
            byte[] digest = md.digest();
            result = String.format("%064x", new BigInteger(1, digest));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public static boolean validate(String string, String hash) {
        String hashedStr1 = hash_string(string);
        return hashedStr1.equals(hash);
    }

    public static void main(String[] args) {
        // Example usage:
        String original = "exampleString";
        String hash = hash_string(original);
        System.out.println("Hash: " + hash);

        // Validate the string
        boolean isValid = validate(original, hash);
        System.out.println("Is valid: " + isValid);
    }
}
