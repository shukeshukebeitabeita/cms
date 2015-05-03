
package com.bsb.cms.controller.upload;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-9-4
 * @since 1.0
 */
public class StrToResponse {

    private int responseStatus;
    private String message;
    private int errorCode;
    private String returnValue;

    public int getResponseStatus() {
        return responseStatus;
    }

    public void setResponseStatus(int responseStatus) {
        this.responseStatus = responseStatus;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getReturnValue() {
        return returnValue;
    }

    public void setReturnValue(String returnValue) {
        this.returnValue = returnValue;
    }

    @Override
    public String toString() {
        return "responseStatus=" + responseStatus + "@message=" + message + "@errorCode=" + errorCode + "@returnValue="
                + returnValue;
    }

}
