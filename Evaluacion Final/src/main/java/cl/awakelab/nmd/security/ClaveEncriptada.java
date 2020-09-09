package cl.awakelab.nmd.security;

import org.mindrot.jbcrypt.BCrypt;

public class ClaveEncriptada {
    
public ClaveEncriptada () {
        
    }
    
 // Define the BCrypt workload to use when generating password hashes. 10-31 is a valid value.
    private static int workload = 10;

    /**
     * This method can be used to generate a string representing an account password
     * suitable for storing in a database. It will be an OpenBSD-style crypt(3) formatted
     * hash string of length=60
     * The bcrypt workload is specified in the above static variable, a value from 10 to 31.
     * A workload of 12 is a very reasonable safe default as of 2013.
     * This automatically handles secure 128-bit salt generation and storage within the hash.
     * @param password_plaintext The account's plaintext password as provided during account creation,
     *                           or when changing an account's password.
     * @return String - a string of length 60 that is the bcrypt hashed password in crypt(3) format.
     */
    public String hashPassword(String password_plaintext) {
            String salt = BCrypt.gensalt(workload);
            String hashed_password = BCrypt.hashpw(password_plaintext, salt);
            return(hashed_password);
    }
    
}
