package cn.edu.neu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.mapper.AddressMapper;
import cn.edu.neu.model.Address;
import cn.edu.neu.service.AddressService;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressMapper addressMapper;

    // ------------------9.9--------------------- 设置默认收货地址
    @Override
    public void setDefaultAddress(String addrId) {
        // TODO Auto-generated method stub
        addressMapper.unsetDefaultAddress();
        addressMapper.setDefaultAddress(addrId);
    }
    // ----------------------------------------


    // ------------------9.7---------------------删除收货地址
    @Override
    public void delAddress(String addrId) {
        // TODO Auto-generated method stub
        addressMapper.delAddress(addrId);
    }
    // ----------------------------------------



    // ------------- 8.6 -------------------
    @Override
    public List<Address> getAddressByUserId(int loginUserId) {
        List<Address> addrs = addressMapper.findAddrByUserId(loginUserId);
        return addrs;
    }
    // ---------------------------------------


    // ------------- 8.4 -------------------
    @Override
    public int addAddress(Address address) {
        // TODO Auto-generated method stub
        return addressMapper.saveAddress(address);
    }

    @Override
    public void updateAddress(Address address) {
        // TODO Auto-generated method stub
        addressMapper.updateAddress(address);
    }
    // ---------------------------------------

	/*


	@Override
	public Address getAddressById(String addrId) {
		Address address = addressMapper.findAddressById(addrId);
		return address;
	}
	*/

}
