package com.main.dto;
import java.util.ArrayList;
import java.util.HashMap;

public class Order {

	public HashMap<Integer,Item> items;
	public Order()
	{
		items = new HashMap<Integer,Item>();
	}
	public void additem(int id, String Name, String Category,String Description,float price)
	{
		Item i = new Item();
		i.id = id;
		i.Name = Name;
		i.Category = Category;
		i.Description = Description;
		i.price = price;
		
		this.additem(i);
	}
	public void additem(Item i)
	{

		if(items.containsKey(i.id))
		{
			Item it = items.remove(i.id);
			it.count++;
			items.put(it.id, it);
		}
		else
		{
			items.put(i.id, i);
		}
		
	}
	
	public void increment(int id)
	{
		if(items.containsKey(id))
		{
			Item it = items.remove(id);
			it.count++;
			items.put(it.id, it);
		}
	}
	
	public void removeitem(int id)
	{
		if(items.containsKey(id))
		{
			Item it = items.remove(id);
		}
	}
	
	public int getsize()
	{
		return items.size();
	}
	
	public static class Item
	{
	int id;
	String Name;
	String Category;
	String Description;
	String imageURL;
	float price;
	int count = 1;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	}

}
