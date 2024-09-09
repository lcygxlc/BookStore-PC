package cn.edu.neu.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import cn.edu.neu.model.Address;
@Mapper
public interface AddressMapper {


    // -------------- 9.9 -----------------
    void setDefaultAddress(String addrId);
    void unsetDefaultAddress();
    // -------------------------------------


    // -------------- 9.7 -----------------
    void delAddress(String addrId);
    // -------------------------------------

    // ------------- 8.6 -------------------
    List<Address> findAddrByUserId(int loginUserId);
    // -------------------------------------


    // ------------- 8.4 -------------------
    int saveAddress(Address address);

    void updateAddress(Address address);
    // -------------------------------------

	/*

	Address findAddressById(String addrId);
	*/

}
