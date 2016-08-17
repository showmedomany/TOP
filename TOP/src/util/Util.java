package util;

public class Util {
	public static String toJS(String str) {
		return str.replace("\r\n", "<br>").replace("\n", "<br>");
	}
}
