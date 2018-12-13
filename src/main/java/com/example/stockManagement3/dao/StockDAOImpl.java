package com.example.stockManagement3.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.stockManagement3.entity.Stock;

@Repository
public class StockDAOImpl implements StockDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Stock> getStocks() {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create query
		Query<Stock> theQuery = currentSession.createQuery("from Stock", Stock.class);

		// execute query
		List<Stock> stocks = theQuery.getResultList();

		// return results
		return stocks;
	}

	@Override
	public void saveStock(Stock theStock) {

		// hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save/update stock
		currentSession.saveOrUpdate(theStock);
	}

	@Override
	public Stock getStock(String theId) {

		// hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// read from database using primary key
		Stock theStock = currentSession.get(Stock.class, theId);

		return theStock;
	}

	@Override
	public void deleteStock(String theId) {

		// hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete stock with primary key
		Query theQuery = currentSession.createQuery("delete from Stock where id=:itemId");
		theQuery.setParameter("itemId", theId);
		theQuery.executeUpdate();
	}

	@Override
	public List<Stock> searchStocks(String theSearchName) {

		// hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = null;
		if (theSearchName != null && theSearchName.trim().length() > 0) {
			theQuery = currentSession
					.createQuery("from Stock where lower(name) like :theName or lower(id) like: theName", Stock.class);
			theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");

		} else {
			theQuery = currentSession.createQuery("from Stock", Stock.class);
		}
		List<Stock> stocks = theQuery.getResultList();

		return stocks;
	}

	@Override
	public void updateStock(String id) {

		// hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		Stock stock = getStock(id);
		stock.setCount(stock.getCount() - 1);

		currentSession.update(stock);
	}

}
