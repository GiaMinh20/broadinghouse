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
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Gia Minh
 */
@Entity
@Table(name = "savedlist")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Savedlist.findAll", query = "SELECT s FROM Savedlist s"),
    @NamedQuery(name = "Savedlist.findBySid", query = "SELECT s FROM Savedlist s WHERE s.sid = :sid"),
    @NamedQuery(name = "Savedlist.findByHid", query = "SELECT s FROM Savedlist s WHERE s.hid = :hid"),
    @NamedQuery(name = "Savedlist.findByUid", query = "SELECT s FROM Savedlist s WHERE s.uid = :uid"),
    @NamedQuery(name = "Savedlist.findByHouseName", query = "SELECT s FROM Savedlist s WHERE s.houseName = :houseName"),
    @NamedQuery(name = "Savedlist.findByPrice", query = "SELECT s FROM Savedlist s WHERE s.price = :price"),
    @NamedQuery(name = "Savedlist.findByLocation", query = "SELECT s FROM Savedlist s WHERE s.location = :location")})
public class Savedlist implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "sid")
    private Integer sid;
    @Basic(optional = false)
    @Column(name = "hid")
    private int hid;
    @Basic(optional = false)
    @Column(name = "uid")
    private int uid;
    @Basic(optional = false)
    @Column(name = "houseName")
    private String houseName;
    @Basic(optional = false)
    @Column(name = "price")
    private double price;
    @Basic(optional = false)
    @Column(name = "location")
    private String location;
    @Basic(optional = false)
    @Lob
    @Column(name = "houseImage")
    private byte[] houseImage;
//    private InputStream houseImage;

    public Savedlist() {
    }

    public Savedlist(Integer sid) {
        this.sid = sid;
    }

    public Savedlist(Integer sid, int hid, int uid, String houseName, double price, String location, byte[] houseImage) {
        this.sid = sid;
        this.hid = hid;
        this.uid = uid;
        this.houseName = houseName;
        this.price = price;
        this.location = location;
        this.houseImage = houseImage;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public byte[] getHouseImage() {
        return houseImage;
    }

    public void setHouseImage(byte[] houseImage) {
        this.houseImage = houseImage;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sid != null ? sid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Savedlist)) {
            return false;
        }
        Savedlist other = (Savedlist) object;
        if ((this.sid == null && other.sid != null) || (this.sid != null && !this.sid.equals(other.sid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Enitity.Savedlist[ sid=" + sid + " ]";
    }
    
}
