package com.azglxx.rst.rs;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Component;

import com.sun.jersey.spi.resource.Singleton;

@Component
@Path("/root")
@Singleton
//@Produces({ MediaType.APPLICATION_JSON })
//@Consumes({ MediaType.APPLICATION_JSON })
public class RootResource extends SuperRS{

	@Path("/hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public Response hello() {
		return ok("Hello!");
	}
}
