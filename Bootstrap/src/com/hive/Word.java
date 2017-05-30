package com.hive;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

public class Word {
	
	RConnection rconn;
	REXP x;
	
	public byte[] getGraph() throws Exception{
		
		rconn = new RConnection();

		rconn.eval("source('C:/rworkspace/count.R')");
		rconn.eval("try(jpeg('wordc.jpg',quality=90))");
		rconn.eval("wordc()");
		rconn.eval("graphics.off()");
		rconn.eval("rb=readBin('wordc.jpg','raw',600*600)");		// read Binary
		
		x=rconn.eval("rb");
		
		rconn.close();
		return x.asBytes();
		
	}

}
