package test1;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import java.text.SimpleDateFormat;

public class DateUtil {
	  public static String NONE_TIME_T = "19700101090000";
	  
	  public static boolean checkDates(String sDate) {
	    try {
	      String _dateStr = remove(sDate, '-');
	      _dateStr = remove(_dateStr, '.');
	      _dateStr = remove(_dateStr, '/');
	      _dateStr = _dateStr.trim();
	      if (_dateStr.length() == 8) {
	        _dateStr = _dateStr + "0000";
	      } else if (_dateStr.length() == 12) {
	        _dateStr = _dateStr + "00";
	      } else if (_dateStr.length() >= 14) {
	        _dateStr = _dateStr.substring(0, 14);
	      } else {
	        return false;
	      } 
	      SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmm", Locale.getDefault());
	      Date result = formatter.parse(_dateStr);
	      String resultStr = formatter.format(result);
	      if (resultStr.equalsIgnoreCase(_dateStr))
	        return true; 
	      return false;
	    } catch (Exception e) {
	      return false;
	    } 
	  }
	  
	  public static boolean checkDate(String sDate) {
	    String dateStr = validChkDate(sDate);
	    String year = dateStr.substring(0, 4);
	    String month = dateStr.substring(4, 6);
	    String day = dateStr.substring(6);
	    return checkDate(year, month, day);
	  }
	  
	  public static boolean checkDate(String year, String month, String day) {
	    try {
	      SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.getDefault());
	      Date result = formatter.parse(year + "." + month + "." + day);
	      String resultStr = formatter.format(result);
	      if (resultStr.equalsIgnoreCase(year + "." + month + "." + day))
	        return true; 
	      return false;
	    } catch (Exception e) {
	      return false;
	    } 
	  }
	  
	  public static String validChkDate(String dateStr) {
	    String _dateStr = dateStr;
	    if (dateStr == null || (dateStr.trim().length() != 6 && dateStr.trim().length() != 8 && dateStr.trim().length() != 10))
	      throw new IllegalArgumentException("Invalid date format: " + dateStr); 
	    if (dateStr.length() == 10) {
	      _dateStr = remove(dateStr, '-');
	      _dateStr = remove(dateStr, '.');
	      _dateStr = remove(dateStr, '/');
	    } 
	    return _dateStr;
	  }
	  
	  public static String remove(String str, char remove) {
	    if (isEmpty(str) || str.indexOf(remove) == -1)
	      return str; 
	    char[] chars = str.toCharArray();
	    int pos = 0;
	    for (int i = 0; i < chars.length; i++) {
	      if (chars[i] != remove)
	        chars[pos++] = chars[i]; 
	    } 
	    return new String(chars, 0, pos);
	  }
	  
	  public static boolean isEmpty(String str) {
	    return (str == null || str.length() == 0);
	  }
	  
	  public static void main(String[] args) {
	    String str = "201210335685";
	    System.out.println(checkDates(str) + "/" + str);
	  }
	}