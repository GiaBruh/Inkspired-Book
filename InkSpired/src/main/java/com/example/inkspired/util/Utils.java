package com.example.inkspired.util;

import org.apache.commons.codec.digest.DigestUtils;

public class Utils {

    public Utils() {
    }

    public String md5Hash(String password) {
        return DigestUtils.md5Hex(password).toLowerCase();
    }
}
