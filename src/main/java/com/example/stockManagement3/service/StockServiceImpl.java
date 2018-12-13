package com.example.stockManagement3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.stockManagement3.dao.StockDAO;
import com.example.stockManagement3.entity.Stock;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	private StockDAO stockDAO;

	@Override
	@Transactional
	public List<Stock> getStocks() {

		return stockDAO.getStocks();
	}

	@Override
	@Transactional
	public void saveStock(Stock theStock) {

		stockDAO.saveStock(theStock);

	}

	@Override
	@Transactional
	public Stock getStock(String theId) {

		return stockDAO.getStock(theId);
	}

	@Override
	@Transactional
	public void deleteStock(String theId) {

		stockDAO.deleteStock(theId);
	}

	@Override
	@Transactional
	public List<Stock> searchStocks(String theSearchName) {

		return stockDAO.searchStocks(theSearchName);
	}

	@Override
	@Transactional
	public void updateStock(String id) {
		stockDAO.updateStock(id);
		
	}

}
