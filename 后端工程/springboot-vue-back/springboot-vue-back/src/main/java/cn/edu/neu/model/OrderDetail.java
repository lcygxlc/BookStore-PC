package cn.edu.neu.model;

public class OrderDetail {
    private int odetailId;
    private int orderId;
    private int goodsId;

    public String getOdetailName() {
        return odetailName;
    }

    public float getOdetailPrice() {
        return odetailPrice;
    }

    public int getOdetailNum() {
        return odetailNum;
    }

    public String getOdetailPic() {
        return odetailPic;
    }

    private String odetailName;
    private float odetailPrice;

    public int getOdetailId() {
        return odetailId;
    }

    public void setOdetailId(int odetailId) {
        this.odetailId = odetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public void setOdetailName(String odetailName) {
        this.odetailName = odetailName;
    }

    public void setOdetailPrice(float odetailPrice) {
        this.odetailPrice = odetailPrice;
    }

    public void setOdetailNum(int odetailNum) {
        this.odetailNum = odetailNum;
    }

    public void setOdetailPic(String odetailPic) {
        this.odetailPic = odetailPic;
    }

    private int odetailNum;
    private String odetailPic;

    public OrderDetail() {
        super();
    }



    @Override
    public String toString() {
        return "OrderDetail [odetailId=" + odetailId + ", orderId=" + orderId + ", goodsId=" + goodsId
                + ", odetailName=" + odetailName + ", odetailPrice="
                + odetailPrice + ", odetailNum=" + odetailNum + ", odetailPic=" + odetailPic + "]";
    }
}
