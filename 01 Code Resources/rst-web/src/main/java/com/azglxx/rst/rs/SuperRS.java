package com.azglxx.rst.rs;

import javax.ws.rs.core.Response;

public abstract class SuperRS {

	public Response ok(Object obj){
		return Response.ok(obj).build();
	}
}
