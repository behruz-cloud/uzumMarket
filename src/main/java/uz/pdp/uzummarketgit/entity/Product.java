package uz.pdp.uzummarketgit.entity;

import lombok.Data;

@Data
public class Product {
    private Integer id=idGen++;
    private String name;
    private Integer price;
    private Integer categoryId;
    private Integer amount=1;
    private String photoUrl;
    private static Integer idGen=1;

    public Product() {
    }

    public Product(String name, Integer price, Integer categoryId, String photoUrl) {
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
        this.photoUrl = photoUrl;
    }

    public Product(String name, Integer price, Integer categoryId) {
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
    }
}
