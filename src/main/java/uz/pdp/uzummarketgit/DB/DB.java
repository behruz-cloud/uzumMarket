package uz.pdp.uzummarketgit.DB;

import uz.pdp.uzummarketgit.entity.*;

import java.util.ArrayList;
import java.util.List;

public interface DB {
    List<User> USERS = new ArrayList(List.of(
            new User("asd", "123",Role.USER),
            new User("aaa", "123",Role.USER),
            new User("adminjon", "root123",Role.ADMIN)
    ));
    List<Product> basket = new ArrayList();
    List<Category> CATEGORIES = new ArrayList(List.of(
            new Category("YEGULIKLAR"),
            new Category("ICHIMLIKLAR"),
            new Category("SHIRINLIKLAR")
    ));
    List<Product> PRODUCTS = new ArrayList(List.of(
            new Product("Norin", 35000, 1, "C:\\Users\\user\\IdeaProjects\\PDP Academy\\Java Backend\\6 - MODUL\\uzum\\files\\0e092993-1b01-4f7b-a271-b7fc3f27f388.jpg"),
            new Product("Palov", 39000, 1, "C:\\Users\\user\\IdeaProjects\\PDP Academy\\Java Backend\\6 - MODUL\\uzum\\files\\dad80c25-866b-4ad8-9220-50e0e2b09104.jpg"),
            new Product("Sho'rva", 35000, 1, "C:\\Users\\user\\IdeaProjects\\PDP Academy\\Java Backend\\6 - MODUL\\uzum\\files\\75e0c717-cddb-4a2d-84f3-cc7e9cb897bf.jpg"),
            new Product("Muzqaymoq", 15000, 3, "C:\\Users\\user\\IdeaProjects\\PDP Academy\\Java Backend\\6 - MODUL\\uzum\\files\\0d1a420d-b316-444d-bb31-d344b023070c.jpg"),
            new Product("Limonat", 18000, 2, "C:\\Users\\user\\IdeaProjects\\PDP Academy\\Java Backend\\6 - MODUL\\uzum\\files\\34d8935c-65a5-4183-990d-71cd65407199.jpg"),
            new Product("Choy", 5000, 2, "C:\\Users\\user\\IdeaProjects\\PDP Academy\\Java Backend\\6 - MODUL\\uzum\\files\\4e298ef3-c96e-4062-a5ac-869809c628e5.jpg")
    ));
    List<Order> ORDERS = new ArrayList();
    List<OrderItem> ORDER_ITEMS = new ArrayList();
}
