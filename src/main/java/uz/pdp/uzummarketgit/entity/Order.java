package uz.pdp.uzummarketgit.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id=idGenerator++;
    private LocalDateTime localDateTime;
    private Status status;
    private Integer userId;
    private static Integer idGenerator = 1;

    public Order(LocalDateTime localDateTime, Status status,Integer userId) {
        this.localDateTime = localDateTime;
        this.status = status;
        this.userId = userId;
    }
}
