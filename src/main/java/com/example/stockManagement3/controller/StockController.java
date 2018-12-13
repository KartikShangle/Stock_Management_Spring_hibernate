package com.example.stockManagement3.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.stockManagement3.entity.Stock;
import com.example.stockManagement3.service.StockService;

@Controller
@RequestMapping({ "/stock", "/" })
public class StockController {
	// inject stock service
	@Autowired
	private StockService stockService;

	private List<Stock> cart = new ArrayList<Stock>();
	private int error = 0;

	@GetMapping({ "/", "/list" })
	public String listStocks(Model theModel) {

		// get stock from the service
		List<Stock> theStocks = stockService.getStocks();

		// add stock to the model
		theModel.addAttribute("stocks", theStocks);
		theModel.addAttribute("error", error);
		error = 0;

		return "list-stocks";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {

		// model attribute to bind form data
		Stock theStock = new Stock();

		theModel.addAttribute("stock", theStock);

		return "add-stock-form";
	}

	@PostMapping("/saveStock")
	public String saveStock(@ModelAttribute("stock") @Validated Stock stock, BindingResult bindingResult,
			Model theModel) {

		if (bindingResult.hasErrors()) {

			theModel.addAttribute("stock", stock);

			return "add-stock-form";
		}
		// save Stock using service
		stockService.saveStock(stock);

		return "redirect:/stock/list";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("itemId") String theId, Model theModel) {

		// get stock from service
		Stock theStock = stockService.getStock(theId);

		// set stock as model attribute to pre-populate form
		theModel.addAttribute("stock", theStock);

		// send to form
		return "add-stock-form";
	}

	@GetMapping("/delete")
	public String deleteStock(@RequestParam("itemId") String theId) {

		// delete stock
		stockService.deleteStock(theId);

		return "redirect:/stock/list";
	}

	@PostMapping("/search")
	public String searchStock(@RequestParam("theSearchName") String theSearchName, Model theModel) {
		List<Stock> theStocks = stockService.searchStocks(theSearchName);
		theModel.addAttribute("stocks", theStocks);
		return "list-stocks";
	}

	@GetMapping("/sellItemForm")
	public String sellItemForm(Model theModel) {

		theModel.addAttribute("stocks", cart);

		return "sell-item";
	}

	@GetMapping("/addToCart")
	public String addToCart(@RequestParam("itemId") String theId, Model theModel) {
		Stock theStock = stockService.getStock(theId);
		int count = 0;
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getId().equals(theStock.getId())) {
				count++;
			}
		}
		if (count < theStock.getCount()) {
			cart.add(theStock);
		} else if (count == theStock.getCount()) {
			error = 1;
		}
		Collections.sort(cart, new sortfunc());

		return "redirect:/stock/list";
	}

	@GetMapping("/checkOut")
	public String checkOut(Model theModel) {

		for (int i = 0; i < cart.size(); i++) {
			stockService.updateStock(cart.get(i).getId());
		}

		cart.clear();

		return "redirect:/stock/list";
	}
}

class sortfunc implements Comparator<Stock> {

	@Override
	public int compare(Stock o1, Stock o2) {

		return o1.getId().compareTo(o2.getId());
	}

}
