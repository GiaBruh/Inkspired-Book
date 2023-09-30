package com.example.inkspired.Models;

import java.io.Serializable;

public class Address implements Serializable {
    private int address_id;
    private String street_number;
    private String street_name;
    private String district;
    private String city;
    private String postal_code;

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getStreet_number() {
        return street_number;
    }

    public void setStreet_number(String street_number) {
        this.street_number = street_number;
    }

    public String getStreet_name() {
        return street_name;
    }

    public void setStreet_name(String street_name) {
        this.street_name = street_name;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    @Override
    public String toString() {
        return "Address{" +
                "address_id=" + address_id +
                ", street_number='" + street_number + '\'' +
                ", street_name='" + street_name + '\'' +
                ", district='" + district + '\'' +
                ", city='" + city + '\'' +
                ", postal_code='" + postal_code + '\'' +
                '}';
    }
}
