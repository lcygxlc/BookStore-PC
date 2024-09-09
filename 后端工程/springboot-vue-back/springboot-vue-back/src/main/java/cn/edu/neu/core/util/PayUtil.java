package cn.edu.neu.core.util;

import cn.edu.neu.config.AlipayConfig;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;

import javax.servlet.http.HttpServletRequest;
import cn.edu.neu.model.PayModel;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class PayUtil {

    public static AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
    /**
     * 验证支付请求是否来自支付宝
     * @param request
     */
    public static PayModel paySuccess(HttpServletRequest request) throws Exception{
        PayModel model = new PayModel();
        //获取支付成功的订单id，更改订单状态
        Map<String,String> params = new HashMap<>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String codeStr = "";
            for (int i = 0; i < values.length; i++) {
                codeStr = (i == values.length - 1) ? codeStr + values[i]
                        : codeStr + values[i] + ",";
            }
            //乱码处理
            codeStr = new String(codeStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, codeStr);
        }
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

            System.out.println("支付成功的订单号是:"+out_trade_no);
            System.out.println("支付交易号是:"+trade_no);
            System.out.println("付款金额是:"+total_amount);

            model.setTarget(out_trade_no);

        }else {
            model.setSuccess(0);
            model.setError("非法请求");
        }
        return  model;
    }
    /**
     * 支付宝支付
     */
    public static PayModel pay(String out_trade_no, String total_amount, String subject, String body){

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String result = null;
        PayModel payModel = new PayModel() ;
        try {
            result = alipayClient.pageExecute(alipayRequest).getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
            payModel.setSuccess(0);
            payModel.setError(e.getMessage());
            return payModel;
        }
        payModel.setTarget(result);
        return payModel;
    }

    /**
     * 查询订单是否付款成功
     * @param out_trade_no
     */
    public static PayModel payQuery(String out_trade_no){
        PayModel payModel = new PayModel();
        AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
        request.setBizContent("{" +
                "\"out_trade_no\":\""+out_trade_no+"\"," +
                "\"trade_no\":\"\""+
                "  }");
        try {
            AlipayTradeQueryResponse response = alipayClient.execute(request);
            System.out.println(response);
            String tradeStatus = response.getTradeStatus();
            if(response.isSuccess()){
                System.out.println("调用成功");
                if(tradeStatus.equals("TRADE_SUCCESS")){
                    return  payModel;
                }
            } else {
                payModel.setSuccess(0);
                payModel.setError("调用失败");
            }
        }catch (Exception e){
            payModel.setSuccess(0);
            payModel.setError(e.getMessage());
        }
        return payModel;
    }
}