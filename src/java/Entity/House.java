/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.InputStream;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Gia Minh
 */
@Entity
@Table(name = "house")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "House.findAll", query = "SELECT h FROM House h"),
    @NamedQuery(name = "House.findById", query = "SELECT h FROM House h WHERE h.id = :id"),
    @NamedQuery(name = "House.findByName", query = "SELECT h FROM House h WHERE h.name = :name"),
    @NamedQuery(name = "House.findByPrice", query = "SELECT h FROM House h WHERE h.price = :price"),
    @NamedQuery(name = "House.findByLocation", query = "SELECT h FROM House h WHERE h.location = :location"),
    @NamedQuery(name = "House.findByDesciption", query = "SELECT h FROM House h WHERE h.desciption = :desciption")})
public class House implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "price")
    private double price;
    @Basic(optional = false)
    @Column(name = "detaillocation")
    private String detailLocation;
    @Basic(optional = false)
    @Column(name = "location")
    private String location;
    @Basic(optional = false)
    @Lob
    @Column(name = "imageUrl")
    private byte[] imageUrl;
//    private InputStream imageUrl;
    @Basic(optional = false)
    @Column(name = "desciption")
    private String desciption;
    @Basic(optional = false)
    @Column(name = "category")
    private String category;
    @Basic(optional = false)
    @Column(name = "userId")
    private int userId;

    public House() {
    }

    public House(Integer id) {
        this.id = id;
    }

    public House(String name, double price,String detailLocation, String location,byte[] imageUrl, String desciption, String category, int userId) {
        this.name = name;
        this.price = price;
        this.detailLocation = detailLocation;
        this.location = location;
        this.imageUrl = imageUrl;
        this.desciption = desciption;
        this.category = category;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDetailLocation() {
        return detailLocation;
    }

    public void setDetailLocation(String detailLocation) {
        this.detailLocation = detailLocation;
    }
    
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public byte[] getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(byte[] imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof House)) {
            return false;
        }
        House other = (House) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "House{" + "id=" + id + ", name=" + name + ", price=" + price + ", location=" + location + ", imageUrl=" + imageUrl + ", desciption=" + desciption + ", category=" + category + ", userId=" + userId + '}';
    }

}
