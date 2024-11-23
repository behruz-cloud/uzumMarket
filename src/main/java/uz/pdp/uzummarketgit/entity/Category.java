package uz.pdp.uzummarketgit.entity;

import lombok.Data;

@Data
public class Category {
    private Integer id=idGen++;
    private String name;
    private static Integer idGen=1;

    public Category(String name) {
        this.name = name;
    }
}
