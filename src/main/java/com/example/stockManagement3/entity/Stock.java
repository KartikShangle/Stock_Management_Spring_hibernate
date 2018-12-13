package com.example.stockManagement3.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "items")
public class Stock {

	@Id
	@NotNull(message = "{NotNull.stock.id}")
	@Size(min = 1, message = "{NotNull.stock.id}")
	@Column(name = "item_id", nullable = false)
	private String id;

	@NotNull(message = "{NotNull.stock.name}")
	@Size(min = 1, message = "{NotNull.stock.name}")
	@Column(name = "item_name", nullable = false)
	private String name;

	@NotNull(message = "{NotNull.stock.price}")
	@Column(name = "item_price", nullable = false)
	private BigDecimal price;

	@NotNull(message = "{NotNull.stock.count}")
	@Column(name = "item_count", nullable = false)
	@Min(0)
	private int count;

	public Stock() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Stock [id=" + id + ", name=" + name + ", price=" + price + ", count=" + count + "]";
	}
}
