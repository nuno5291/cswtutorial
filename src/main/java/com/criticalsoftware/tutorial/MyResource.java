
package com.criticalsoftware.tutorial;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;

/** Example resource class hosted at the URI path "/myresource"
 */
@Path("/myresource")
public class MyResource {
    
    /** Method processing HTTP GET requests, producing "text/plain" MIME media
     * type.
     * @return String that will be send back as a response of type "text/plain".
     */
    @GET
    @Produces("text/plain")
    public String getIt() {
        return "Hi there 123!";
    }

    @GET
    @Path("{n1}/{n2}")
    @Produces("application/json")
    public String soma(@PathParam("n1") int nr1,
                       @PathParam("n2") int nr2){
        int soma = nr1+nr2;
        String output = "Soma : " + soma;

        return output;
    }
}
