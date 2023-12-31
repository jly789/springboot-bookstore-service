package com.DreamBook.BookStoreService.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AlertMessage {


    public static String warningMessage(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(
                "<script>" +
                        "	alert('" + message + "');" +
                        "	history.back();" +
                        "</script>"
        );
        out.flush();
        return null;
    }

    public static String warningMessage(HttpServletResponse response, int num, String message) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(
                "<script>" +
                        "	alert('" + message + "');" +
                        "	history.go(" + num + ");" +
                        "</script>"
        );
        out.flush();
        return null;
    }
    public static String warningMessage(HttpServletResponse response, String url, String message) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(
                "<script>" +
                        "	alert('" + message + "');" +
                        "	location.href='" + url + "';" +
                        "</script>"
        );
        out.flush();
        return null;
    }
}
