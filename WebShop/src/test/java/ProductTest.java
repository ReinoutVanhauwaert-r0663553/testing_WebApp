


import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import db.ProductDb;
import db.ProductDbSql;
import domain.Product;

public class ProductTest {
	String url = "http://localhost:8080/WebShop/Controller";
	WebDriver driver;
	Product productSmokeTest;
	ProductDbSql productdb = new ProductDbSql();

	@Before
	public void setUp() {
		productSmokeTest = new Product("Dark3", "Game", 60);
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		driver = new ChromeDriver();
		driver.get(url);
	}
	
	@After
	public void breakdown(){
		productdb.delete(productSmokeTest.getName(), productSmokeTest.getDescription(), productSmokeTest.getPrice());
		driver.close();
	}
	
	@Test
	public void registerProduct(){
		driver.get(url + "?action=addProduct");
		
		WebElement nameField = driver.findElement(By.id("name"));
		nameField.sendKeys(productSmokeTest.getName());
		
		WebElement descriptionField = driver.findElement(By.id("description"));
		descriptionField.sendKeys(productSmokeTest.getDescription());
		
		WebElement priceField = driver.findElement(By.id("price"));
		priceField.sendKeys(Double.toString(productSmokeTest.getPrice()));
		
		WebElement saveButton = driver.findElement(By.id("save"));
		saveButton.click();
		
		assertEquals("Products", driver.findElement(By.cssSelector("h2")).getText());	
	}
	
}