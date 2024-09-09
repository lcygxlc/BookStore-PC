package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.model.Address;

public interface AddressService {


    // ------------- 9.9 -------------------
    void setDefaultAddress(String addrId);
    // -------------------------------------


    // ------------- 9.7 -------------------
    void delAddress(String addrId);
    // -------------------------------------


    // ------------- 8.6 -------------------
    List<Address> getAddressByUserId(int loginUserId);
    // -------------------------------------

    // ------------- 8.4 -------------------
    int addAddress(Address address);

    void updateAddress(Address address);
    // -------------------------------------

/*


	Address getAddressById(String addrId);
*/

}
