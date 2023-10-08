package com.example.inkspired.model;

import java.io.Serializable;

public class Address implements Serializable {

    private int address_id;
    private String street_name;
    private String ward;
    private String district;
    private String city;
    private String province;
    private String postal_code;

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
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

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "Address [address_id=" + address_id + ", street_name=" + street_name + ", ward=" + ward + ", district="
                + district + ", city=" + city + ", province=" + province + ", postal_code=" + postal_code + "]";
    }
}
