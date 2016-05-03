package com.utillities;

public class Synchro {

	public static Synchro sync;
	
	public static Synchro getSynchro(){
		if (sync == null)
			sync = new Synchro();
		return sync;
	}
}
