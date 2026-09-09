package vn.iotstar.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "categories")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryId")
    private Integer categoryId;

    @Column(name = "categoryname", columnDefinition = "nvarchar(255)", nullable = false)
    private String categoryname;

    @Column(name = "images", columnDefinition = "nvarchar(500)")
    private String images;

    @Column(name = "status")
    private Integer status;
}
