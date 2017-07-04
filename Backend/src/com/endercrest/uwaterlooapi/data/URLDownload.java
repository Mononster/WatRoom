package com.endercrest.uwaterlooapi.data;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by Thomas Cordua-von Specht on 11/23/2016.
 */
class URLDownload {

    private URL url;

    public URLDownload(String url) throws MalformedURLException {
        this.url = new URL(url);
    }

    public URLDownload(URL url){
        this.url = url;
    }

    public String downloadContents() throws IOException {
        URLConnection conn = url.openConnection();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String finalOutput = "";

        String line;
        while((line = br.readLine()) != null){
            finalOutput += finalOutput.equalsIgnoreCase("")? line : "\n"+line;
        }
        return finalOutput;
    }
}
