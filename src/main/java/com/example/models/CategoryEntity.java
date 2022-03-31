package com.example.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Category", schema = "dbo", catalog = "WEBBANHANG")
public class CategoryEntity {
    private int id;
    private String name;
    private List<ProductEntity> productsById;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 30)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoryEntity that = (CategoryEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "categoryByCategoryId")
    public List<ProductEntity> getProductsById() {
        return productsById;
    }

    public void setProductsById(List<ProductEntity> productsById) {
        this.productsById = productsById;
    }
}
