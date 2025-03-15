/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(String id) {
        for (Item item : items) {
            if (item.getProduct().getId().equalsIgnoreCase(id)) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        }
        items.add(t);
    }

    public void removeItem(String id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item item : items) {
            t += (item.getQuantity() * item.getPrice());
        }
        return t;
    }

    private Product getProductById(String id, List<Product> list) {
        for (Product product : list) {
            if (product.getId().equalsIgnoreCase(id)) {
                return product;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        List<Product> list = new ArrayList<>();
        Cart ca = new Cart();
        Product d = ca.getProductById("ip1", list);
        System.out.println(d);
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("-");
                for (String string : s) {
                    String[] n = string.split(":");
                    String id = n[0];
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    Item i = new Item(p, quantity, p.getPrice());
                    addItem(i);
                }
            }
        } catch (NumberFormatException e) {
        }

    }

    public void addProductCart(ProductCart productCart) {
        Cart cart = new Cart();
        List<ProductCart> item = new ArrayList<>();
        item.add(productCart);
        System.out.println("Total Money: " + cart.getTotalMoney());
        

    }

}
