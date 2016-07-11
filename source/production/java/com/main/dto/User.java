package com.main.dto;

import java.util.HashMap;

public class User {
	
String UserId;
String Email;
String Name;
String ImageURL;
String Locale;
String FamilyName;
String GivenName;

public String getUserId() {
	return UserId;
}
public void setUserId(String userId) {
	UserId = userId;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getImageURL() {
	return ImageURL;
}
public void setImageURL(String imageURL) {
	ImageURL = imageURL;
}
public String getLocale() {
	return Locale;
}
public void setLocale(String locale) {
	Locale = locale;
}
public String getFamilyName() {
	return FamilyName;
}
public void setFamilyName(String familyName) {
	FamilyName = familyName;
}
public String getGivenName() {
	return GivenName;
}
public void setGivenName(String givenName) {
	GivenName = givenName;
}

public HashMap<String,String> getparam()
{
HashMap<String,String> par = new HashMap<String,String>();

par.put("user_id", Email);
par.put("user_fname", GivenName);
par.put("user_lname", FamilyName);
par.put("user_img", ImageURL);

return par;
}


}
