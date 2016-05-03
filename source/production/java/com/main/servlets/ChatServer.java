package com.main.servlets;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.utillities.Synchro;

@ServerEndpoint(value="/chatserver")
public class ChatServer {
	private static Set<Session> mySessions = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session.getId() + " has opened a connection!");
		synchronized (Synchro.getSynchro()) {
			mySessions.add(session);
		}
		try {
			session.getBasicRemote().sendText("Connection Established");
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("Message from " + session.getId() + ": " + message);
		synchronized (Synchro.getSynchro()) {
			for (Session s : mySessions) {
				if (s != session) {
					try {
						System.out.println("Sending to " + s.getId() + " from server " + this);
						s.getAsyncRemote().sendText(message);
					} catch (Exception ioe) {
						System.err.println("Removing Dead Session");
						try {
							mySessions.remove(s);
						} catch (Exception e) {
							System.err.println("Exception on Remove Dead Session" + e);
						}
					}
				}
			}
		}
	} // synchronized

	@OnClose
	public void onClose(Session session) {
		System.out.println("Session " + session.getId() + " has ended");
		synchronized (Synchro.getSynchro()) {
			mySessions.remove(session);
		}
	}

	@OnError
	public void onBigError(Session session, Throwable thr) {
		System.err.println("Session " + session.getId() + " closed suddenly");
	}
}