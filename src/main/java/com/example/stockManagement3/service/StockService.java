package com.example.stockManagement3.service;

import java.util.List;

import com.example.stockManagement3.entity.Stock;

public interface StockService {

	public List<Stock> getStocks();

	public void saveStock(Stock theStock);

	public Stock getStock(String theId);

	public void deleteStock(String theId);

	public List<Stock> searchStocks(String theSearchName);

	public void updateStock(String id);
	
}
