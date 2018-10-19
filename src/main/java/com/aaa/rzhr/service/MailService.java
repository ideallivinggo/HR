package com.aaa.rzhr.service;

/**
 * @author XBJ
 * @date 2018-10-15 22:13
 */
public interface MailService {
    void sendSimpleMail(String to, String subject, String content);
}
