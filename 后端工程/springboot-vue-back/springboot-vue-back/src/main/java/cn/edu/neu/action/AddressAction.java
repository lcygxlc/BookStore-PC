package cn.edu.neu.action;


import java.util.List;


import cn.edu.neu.core.common.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.model.Address;
import cn.edu.neu.service.AddressService;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/address")
public class AddressAction extends BaseAction {

    @Autowired
    private AddressService addressService;


    // ------------------ 9.9 ---------------------设置默认收货地址
    @RequestMapping(value = "/setDefaultAddress", method = RequestMethod.POST)
    public R setDefaultAddress(@RequestParam String addrId) {
        try {
            addressService.setDefaultAddress(addrId);
            return R.ok("设置默认地址成功");
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("设置默认地址失败");
        }
    }
    // ---------------------------------------


    // ------------------ 9.7 ---------------------删除收货地址
    @RequestMapping(value = "/delAddress", method = RequestMethod.POST)
    public R delAddress(@RequestParam String addrId) {
        try {
            addressService.delAddress(addrId);
            return R.ok("删除成功");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return R.error("删除收货地址失败");
        }
    }
    // ---------------------------------------


    // ------------- 8.6 -------------------
    @RequestMapping(value = "/getMyAddress", method = RequestMethod.GET)
    public R getMyAddress() {

        int loginUserId = this.getLoginUserId();

        System.out.println("loginUserId = " + loginUserId );

        // 以下这行代码是为了单元测试，在生成环境下要去掉这行代码
        //if ( loginUserId == 0 ) loginUserId = 1;

        List<Address> addrs = addressService.getAddressByUserId( loginUserId );
        return R.ok().put("addrs", addrs).put("loguser", getLoginUserId());
    }
    // ---------------------------------------


    // ------------- 8.4 -------------------
    @RequestMapping(value = "/handleAddress", method = RequestMethod.POST)
    public R handleAddress(Address address) {
        int addrId = 0;

        try {
            if (address.getAddrId() == 0) {

                int loginUserId = this.getLoginUserId();

                System.out.println( " #### loginUserId = " + loginUserId );

                // 以下这行代码是为了单元测试，在生成环境下要去掉这行代码
                //if ( loginUserId == 0 ) loginUserId = 1;

                address.setUserId(loginUserId);
                addrId = addressService.addAddress(address);
            } else {
                addressService.updateAddress(address);
                addrId = address.getAddrId();
            }
            return R.ok("保存成功").put("addrId", addrId);
        } catch (Exception e) {
            return R.error(500, e.getMessage());
        }
    }
    // ---------------------------------------

    /*

    @RequestMapping(value = "/delAddress", method = RequestMethod.POST)
    public R delAddress(@RequestParam String addrId) {
        try {
            addressService.delAddress(addrId);
            return R.ok("删除成功");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return R.error("删除收货地址失败");
        }
    }

    @RequestMapping(value = "/setDefaultAddress", method = RequestMethod.POST)
    public R setDefaultAddress(@RequestParam String addrId) {
        try {
            addressService.setDefaultAddress(addrId);
            return R.ok("设置默认地址成功");
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("设置默认地址失败");
        }
    }


    @RequestMapping("getAddressById")
    public R getAddressById(@RequestParam String addrId) {
        try {
            Address addr = addressService.getAddressById(addrId);
            return R.ok().put("addr", addr);
        } catch (Exception e) {
            return R.error(500, e.getMessage());
        }
    }

    @RequestMapping("/getMyAddressAjax")
    public R getMyAddressAjax() {
        List<Address> addrs = addressService.getAddressByUserId(this
                .getLoginUserId());
        return R.ok().put("addrs", addrs);

    }

    @RequestMapping("/handleAddressAjax")
    public R handleAddressAjax(Address address) {
        try {
            if (address.getAddrId() == 0) {
                address.setUserId(getLoginUserId());
                addressService.addAddress(address);
            } else {
                addressService.updateAddress(address);
            }
            return R.ok("地址处理成功");
        } catch (Exception e) {
            return R.error(500, e.getMessage());
        }
    }

    @RequestMapping("/delAddressAjax")
    public R delAddressAjax(@RequestParam String addrId) {
        try {
            addressService.delAddress(addrId);
            return R.ok("地址删除成功");
        } catch (Exception e) {
            return R.error(500, e.getMessage());
        }
    }
    */
}
