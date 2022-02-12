/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nicol
 */
public class MD5PorString {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        MessageDigest m;
        String s = "jose";
        try {
            m = MessageDigest.getInstance("MD5");
            m.update(s.getBytes(), 0, s.length());
            String bg = new BigInteger(1, m.digest()).toString(16);
            System.out.println(bg);
        } catch (NoSuchAlgorithmException e) {
             Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, e);
        }
        System.out.println(s);
    }
    
}
